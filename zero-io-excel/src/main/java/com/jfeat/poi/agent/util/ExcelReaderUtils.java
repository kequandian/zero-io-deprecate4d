package com.jfeat.poi.agent.util;

import com.jfeat.poi.agent.util.lang.ExcelException;
import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ExcelReaderUtils {


    public static List<List<List<String>>> readSheets(File file, int sheetIndex, int startRow, int endRow) {
        Workbook wb = readWorkBook(file);
        return readSheets(wb, sheetIndex, startRow, endRow);
    }


    public static List<List<List<String>>> readSheets(InputStream inputStream, int sheetIndex, int startRow, int endRow) {
        Workbook wb = readWorkBook(inputStream);
        return readSheets(wb, sheetIndex, startRow, endRow);
    }

    /**
     * 多sheet
     *
     * @return
     */
    public static List<List<List<String>>> readSheets(Workbook wb, int sheetIndex, int startRow, int endRow) {
        List<List<List<String>>> result = new ArrayList<>();

        int startSheet = sheetIndex, endSheet = sheetIndex;
        if (sheetIndex == -1) {
            startSheet = 0;
            endSheet = wb.getNumberOfSheets() - 1;
        }

        for (int i = startSheet; i <= endSheet; i++) {

            Sheet sheet = wb.getSheetAt(i);
            List<List<String>> sheetList = new ArrayList<>();
            int rows = sheet.getLastRowNum();
            if (startRow < sheet.getFirstRowNum()) {
                startRow = sheet.getFirstRowNum();
            }

            // end row
            if (endRow == -1) {
                endRow = rows;
            } else if (endRow < 0) {
                throw new RuntimeException("fatal: invalid endRow:" + endRow);
            }
            endRow = Math.min(endRow, rows);

//                获取第一行有多少列
            int firstCellNum = 0;

            for (int rowIndex = startRow; rowIndex <= endRow; rowIndex++) {
                Row row = sheet.getRow(rowIndex);
                List<String> columns = new ArrayList<>();
                int cellNum = row.getLastCellNum();
                if (rowIndex == startRow) {
                    firstCellNum = cellNum;
                }
                //System.out.println(row.getLastCellNum());
                //System.out.println(row.getPhysicalNumberOfCells());
                for (int cellIndex = row.getFirstCellNum(); cellIndex < firstCellNum; cellIndex++) {
                    Cell cell = row.getCell(cellIndex);
                    String column = "";
                    if (cell == null) {
                        column = "";
                    } else {
                        // int cellType = cell.getCellType();
                        CellType cellType = cell.getCellType();
                        switch (cellType) {
                            case NUMERIC:
                                double numberValue = cell.getNumericCellValue();
                                cell.setCellType(CellType.STRING);
                                column = cell.getStringCellValue();
                                if (column.contains("E")) {
                                    column = BigDecimal.valueOf(numberValue).toPlainString();
                                }
                                break;
                            case STRING:
                                column = cell.getStringCellValue();
                                break;
                            case BOOLEAN:
                                column = cell.getBooleanCellValue() + "";
                                break;
                            case FORMULA:
                                column = cell.getCellFormula();
                                break;
                            case ERROR:

                            case BLANK:
                                column = " ";
                                break;
                            default:
                        }
                    }
                    columns.add(column.trim());
                }

                List<Boolean> rowFilterFlagList = new ArrayList<>();

                //List<RowFilter> rowFilterList = new ArrayList<>();
                //for (int k = 0; k < rowFilterList.size(); k++) {
                //    RowFilter rowFilter = rowFilterList.get(k);
                //    rowFilterFlagList.add(rowFilter.doFilter(rowIndex, columns));
                //}

                if (!rowFilterFlagList.contains(false)) {
                    sheetList.add(columns);
                }
            }
            result.add(sheetList);
        }
        return result;
    }

    public static List<List<List<String>>> readSheets(File file) {
        /// first sheet, from first row to last rows
        return readSheets(file, 0, 0, -1);
    }

    /**
     * 只取第一个sheet
     *
     * @param file
     * @return
     */
    public static List<List<String>> readSheet(File file, int startRow, int endRow) {
        return readSheets(file, 0, startRow, endRow).get(0);
    }

    public static List<List<String>> readSheet(File file) {
        /// first sheet, from first row to last rows
        return readSheets(file, 0, 0, -1).get(0);
    }

    public static List<List<String>> readSheet(InputStream inputStream) {
        return readSheets(inputStream, 0, 0, -1).get(0);
    }


    public static List<List<String>> getSubContents(List<List<String>> contents, int start, int end) {
        List<List<String>> subContents = new ArrayList<>();

        if (start == 0 && end == contents.get(0).size()) {
            subContents.addAll(contents);
        } else {
            for (List<String> row : contents) {
                subContents.add(row.subList(start, end));
            }
        }
        return subContents;
    }

    public static List<List<String>> appendContents(List<List<String>> contents, List<String> values) {

        List<List<String>> subContents = new ArrayList<>();

        for (List<String> row : contents) {
            List<String> newRow = new ArrayList<>();
            newRow.addAll(row);
            newRow.addAll(values);

            subContents.add(newRow);
        }

        return subContents;
    }

    public static Workbook readWorkBook(File file) {
        Workbook wb;
        try {
            wb = WorkbookFactory.create(file);
        } catch (Exception e) {
            throw new ExcelException(e);
        }
        return wb;
    }

    public static Workbook readWorkBook(InputStream inputStream) {
        Workbook wb;
        try {
            wb = WorkbookFactory.create(inputStream);
        } catch (Exception e) {
            throw new ExcelException(e);
        }
        return wb;
    }
}