package com.jfeat.poi.agent.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

/**
 * Created by vincenthuang on 16/05/2018.
 */
public class ExcelContentRowsUtil {
    private static final Logger logger = LoggerFactory.getLogger(DatabaseReadWrite.class);

    /**
     * 合并重复的项
     *
     * @param contents
     * @param fields
     * @param unique
     * @return
     */
    public static List<List<String>> mergeDuplicateContentRows(List<List<String>> contents, List<String> fields, List<String> unique) {
        if (unique == null || unique.size() == 0) {
            return contents;
        }

        List<Integer> contentIndex = new ArrayList<>();

        for (String uniq : unique) {
            if (fields.contains(uniq))
                contentIndex.add(fields.indexOf(uniq));
        }

        Map<List<String>, List<String>> map = new HashMap<>();
        for (List<String> content : contents) {
            List<String> keys = new ArrayList<>();
            for (Integer index : contentIndex) {
                keys.add(content.get(index));
            }
            if (!map.containsKey(keys)) {
                map.put(keys, content);
            } else {
                logger.info("Duplicate rows：" + map.get(keys).toString());
                logger.info("Duplicate rows：" + content.toString());
                mergeRow(map.get(keys), content);
            }
        }

        List<List<String>> temps = new ArrayList<>();
        temps.addAll(map.values());


        return temps;
    }

    private static void mergeRow(List<String> row, List<String> mergeRow) {
        for (int i = 0; i < row.size(); i++) {
            String value = row.get(i);
            String mergeValue = mergeRow.get(i);

            if (value == null || value.length() == 0) {
                if (mergeValue != null && mergeValue.length() > 0) {
                    row.set(i, mergeValue);
                }
            }
        }
    }


    /**
     * 移走完全相同的项 生成新的不包含 相同项的行
     *
     * @param originContents
     * @return
     */
    public static List<List<String>> mergeDuplicateContentRows(List<List<String>> originContents) {
        if (originContents == null || originContents.size() == 1) {
            return originContents;
        }

        List<List<String>> contents = new ArrayList<>();
        List<Integer> hashCode = new ArrayList<>();
        Iterator<List<String>> listIterator = originContents.iterator();
        while (listIterator.hasNext()) {
            List<String> stringList = listIterator.next();
            int code = stringList.hashCode();
            if (!hashCode.contains(code)) {
                contents.add(stringList);
                hashCode.add(code);
            }
        }
        return contents;
    }


    /**
     * 从左边的行 移走 右边的行 生成新的不包括右边 rows 的行数
     *
     * @param contents 原行数
     * @param rows     从原行数中被排除的行数
     * @return
     */
    public static List<List<String>> subContentRows(List<List<String>> contents, List<List<String>> rows) {

        if (rows == null || rows.size() == 0) {
            return contents;
        }

        List<List<String>> resultContents = new ArrayList<>();
        resultContents.addAll(contents);

        /// create new ones
        for (List<String> row : rows) {
            if (resultContents.contains(row)) {
                resultContents.remove(row);
            }
        }

        return resultContents;
    }


    /**
     * 从读取自 excel contents 中 找查 与 findRow 具有相同值的 行
     *
     * @param contents 被查询的行数
     * @param fields   对应域列
     * @param findRow  要查找的项 （不包括空字段）
     * @return
     */
    public static List<String> findEqualRow(List<List<String>> contents, List<String> fields, List<String> findRow) {
        for (List<String> row : contents) {

            List<String> filterRow = new ArrayList<>();

            /// skip 空字段
            for (int i = 0; i < row.size(); i++) {
                if (fields.get(i) != null && fields.get(i).length() > 0) {
                    filterRow.add(row.get(i));
                }
            }

            if (isRowEquals(filterRow, findRow)) {
                return row;
            }
        }
        return null;
    }


    /**
     * 从 excel contents 中查找与 包括 指定 "键/值" 与  keyField/keyValue 相同的行
     *
     * @param contents 被查找原行数
     * @param fields   被查找原域名
     * @param keyField 域名
     * @param keyValue 域值
     * @return
     */
    public static List<String> findContentRow(List<List<String>> contents, List<String> fields, String keyField, String keyValue) {
        for (List<String> row : contents) {
            Map<String, String> rowHash = buildRowHash(row, fields);

            if (!rowHash.containsKey(keyField)) {
                throw new RuntimeException("row do not contains duplicate field " + keyField);
            }

            String value = rowHash.get(keyField);
            if (value != null) {
                if (value.compareTo(keyValue) == 0) {
                    return row;
                }
            } else {

                // if both is null, consider to be equal
                if (value == keyValue) {
                    return row;
                }
            }
        }

        return null;
    }

    /**
     * 从 excel contents 中查找与 包括 指定 "键/值" 与  keyField/keyValue 相同的行
     *
     * @param contents 被查找原行数
     * @param fields   被查找原域名
     * @return
     */
    public static List<String> findContentRow(List<List<String>> contents, List<String> fields, List<String> keys, List<String> values) {
        for (List<String> row : contents) {
            Map<String, String> rowHash = buildRowHash(row, fields);

            int ok = 0;
            int n = 0;
            for (String keyField : keys) {

                String keyValue = values.get(n);

                if (keyField != null) {

                    if (!rowHash.containsKey(keyField)) {
                        throw new RuntimeException("row do not contains duplicate field " + keyField);
                    }

                    String value = rowHash.get(keyField);
                    if (value != null) {
                        if (value.compareTo(keyValue) == 0) {
                            ok++;
                        }
                    }
                }
                n++;
            }

            if (ok == keys.size()) {
                return row;
            }
        }

        return null;
    }


    /**
     * 从 excel contents 中查找与 重复行 所指定的 唯一字段 相同的 行
     *
     * @param contents excel 行导入内容
     * @param fields   指字的对应的数据域字段
     * @param rows     从数据库中查出的重复项，大不与 unique 一致
     * @param unique   所指定的唯一属性
     * @return
     */
    public static List<List<String>> findDuplicateRows(List<List<String>> contents, List<String> fields,
                                                       List<List<String>> rows, List<String> unique) {
        if (rows == null || rows.size() == 0) {
            return null;
        }

    /*    if(unique!=null && rows.get(0).size()!=unique.size()){
            throw new RuntimeException("fatal: unique size is not equal from query ones from database: " + unique.size() + "<->"+rows.get(0).size());
        }*/

        List<List<String>> findOnes = new ArrayList<>();

        if (unique != null && unique.size() > 0) {

            for (int i = 0; i < rows.size(); i++) {
                List<String> row = rows.get(i);

                List<String> findOne = findContentRow(contents, fields, unique, row);

                if (findOne != null) {
                    findOnes.add(findOne);
                }

                /// no OR logic, but AND logic for unique
                /*for (int n = 0; n < unique.size(); n++) {
                    String field = unique.get(n);
                    String value = row.get(n);

                    List<String> findOne = findContentRow(contents, fields, field, value);
                    if (findOne != null) {
                        findOnes.add(findOne);
                    }
                }*/
            }


        } else {
            /// unique == null

            // check all fields
            for (int i = 0; i < rows.size(); i++) {
                List<String> row = rows.get(i);

                /// 查找一样的项
                List<String> foundRow = findEqualRow(contents, fields, row);

                if (row != null) {
                    findOnes.add(foundRow);
                }
            }
        }

        return findOnes;
    }


    /**
     * 创建 行字典， 通过域作为键, 获取其键值
     *
     * @param row    行各域值
     * @param fields 行域名
     * @return
     */
    public static Map<String, String> buildRowHash(List<String> row, List<String> fields) {
        if (row.size() != fields.size()) {
            throw new RuntimeException("row and fields size is not euqal!");
        }

        Map<String, String> hash = new HashMap<>();

        for (int i = 0; i < row.size(); i++) {
            String field = fields.get(i);
            String value = row.get(i);
            hash.put(field, value);
        }

        return hash;
    }

    /**
     * 判断两行是否值相同
     *
     * @param row1 第一行
     * @param row2 第二行
     * @return
     */
    public static boolean isRowEquals(List<String> row1, List<String> row2) {
//        if (row1.size() != row2.size()) {
//            throw new RuntimeException("checkRowEqual(row1, row2) parameter size not equal!");
//        }
//        for (int i = 0; i < row1.size(); i++) {
//            String val1 = row1.get(i);
//            String val2 = row2.get(i);
//            if (val1 == null && val2 == null) {
//                continue;
//            }
//            if (val1 == null && val2 != null) {
//                return false;
//            }
//            if (val1 != null && val2 == null) {
//                return false;
//            }
//            if (val1.compareTo(val2) != 0) {
//                return false;
//            }
//        }
        if (row1.hashCode() == row2.hashCode())
            return true;
        else
            return false;
    }
}
