package com.jfeat.poi.agent.util;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

public class ExcelWriter {

    /**
     * for test
     **/
    public static void main(String[] args) {
        List<List<String>> data = new ArrayList<>();
        data.add(Arrays.asList(new String[]{"name", "", "sex"}));
        data.add(Arrays.asList(new String[]{"zy", "", "man"}));

        try (OutputStream matrixOut = new FileOutputStream(new File("excel-write-matrix-test.xlsx"));
             OutputStream bookOut = new FileOutputStream(new File("excel-write-book-test.xlsx"));) {
            Workbook matrix = new ExcelWriter().writeMatrix(data);
            matrix.write(matrixOut);

            Workbook book = new ExcelWriter().header(data.get(0).toArray(new String[0])).column(data.get(1).toArray(new String[0])).writeMatrix(data);
            book.write(bookOut);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<List<?>> dice(List<?> num, int chunkSize) {
        int size = num.size();
        int chunk_num = size / chunkSize + (size % chunkSize == 0 ? 0 : 1);
        List<List<?>> result = new ArrayList<>();
        for (int i = 0; i < chunk_num; i++) {
            result.add(new ArrayList<>(num.subList(i * chunkSize, i == chunk_num - 1 ? size : (i + 1) * chunkSize)));
        }
        return result;
    }


    public static final String VERSION_2003 = "2003";
    private static final int HEADER_ROW = 1;
    private static final int MAX_ROWS = 65535;

    private String version;
    private String[] sheetNames = new String[]{"sheet"};
    private int cellWidth = 4000;
    private int headerRow;
    private String[][] headers;
    private String[][] columns;

    public ExcelWriter() {
    }

    public ExcelWriter version(String version) {
        this.version = version;
        return this;
    }

    public ExcelWriter sheetName(String sheetName) {
        this.sheetNames = new String[]{sheetName};
        return this;
    }

    public ExcelWriter sheetNames(String... sheetName) {
        this.sheetNames = sheetName;
        return this;
    }

    public ExcelWriter cellWidth(int cellWidth) {
        this.cellWidth = cellWidth;
        return this;
    }

    public ExcelWriter headerRow(int headerRow) {
        this.headerRow = headerRow;
        return this;
    }

    public ExcelWriter header(String... header) {
        this.headers = new String[][]{header};
        return this;
    }

    public ExcelWriter headers(String[]... headers) {
        this.headers = headers;
        return this;
    }

    public ExcelWriter column(String... column) {
        this.columns = new String[][]{column};
        return this;
    }

    public ExcelWriter columns(String[]... columns) {
        this.columns = columns;
        return this;
    }

    /**
     * @param data
     * @return
     **/
    public Workbook writeMatrix(List<List<String>> data) {
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet(sheetNames[0]);
        Cell cell;
        Row row;
        if (data == null || data.isEmpty()) {
            return wb;
        }
        for (int i = 0; i < data.size(); i++) {
            row = sheet.createRow(i);
            if (data.get(i) == null || data.get(i).isEmpty()) {
                continue;
            }
            if (cellWidth > 0) {
                sheet.setColumnWidth(i, cellWidth);
            }
            for (int j = 0; j < data.get(i).size(); j++) {
                cell = row.createCell(j);
                cell.setCellValue(data.get(i).get(j));
            }
        }
        return wb;
    }


    public Workbook writeBook(List<?>... data) {
        Workbook wb = null;
        if (VERSION_2003.equals(version)) {
            wb = new HSSFWorkbook();
            if (data.length > 1) {
                for (int i = 0; i < data.length; i++) {
                    List<?> item = data[i];
                    //Preconditions.checkArgument(item.size() < MAX_ROWS, "Data [" + i + "] is invalid:invalid data size (" + item.size() + ") outside allowable range (0..65535)");
                }
            } else if (data.length == 1 && data[0].size() > MAX_ROWS) {
                data = dice(data[0], MAX_ROWS).toArray(new List<?>[]{});
                String sheetName = sheetNames[0];
                sheetNames = new String[data.length];
                for (int i = 0; i < data.length; i++) {
                    sheetNames[i] = sheetName + (i == 0 ? "" : (i + 1));
                }
                String[] header = headers[0];
                headers = new String[data.length][];
                for (int i = 0; i < data.length; i++) {
                    headers[i] = header;
                }
                String[] column = columns[0];
                columns = new String[data.length][];
                for (int i = 0; i < data.length; i++) {
                    columns[i] = column;
                }
            }
        } else {
            wb = new XSSFWorkbook();
        }

        if (data.length == 0) {
            return wb;
        }

        for (int i = 0; i < data.length; i++) {
            Sheet sheet = wb.createSheet(sheetNames[i]);

            Row row;
            Cell cell;
            String[] currentSheetHeaders = headers[i];

            if (currentSheetHeaders.length > 0) {
                row = sheet.createRow(0);
                if (headerRow <= 0) {
                    headerRow = HEADER_ROW;
                }
                headerRow = Math.min(headerRow, MAX_ROWS);
                for (int h = 0, lenH = currentSheetHeaders.length; h < lenH; h++) {
                    if (cellWidth > 0) {
                        sheet.setColumnWidth(h, cellWidth);
                    }
                    cell = row.createCell(h);
                    cell.setCellValue(headers[i][h]);
                }
            }


            /// process each row
            List rowData = data[i];

            for (int j = 0, len = rowData.size(); j < len; j++) {
                row = sheet.createRow(j + headerRow);
                Object obj = rowData.get(j);
                if (obj == null) {
                    continue;
                }
                if (obj instanceof Map) {
                    Map<String, Object> map = (Map<String, Object>) obj;
                    processRowWithColumns(row, columns[i] != null ? columns[i] : null, map);
                } else {
                    throw new RuntimeException("Not support type[" + obj.getClass() + "]");
                }
            }
        }
        return wb;
    }


    /**
     * process single row with specific columns
     *
     * @param row
     * @param columns specify columns to write
     * @param map     row data map with column name
     */
    private void processRowWithColumns(Row row, String[] columns, Map<String, Object> map) {
        Cell cell;

        if (columns == null || columns.length == 0) { // show all if column not specified
            Set<String> keys = map.keySet();
            int columnIndex = 0;
            for (String key : keys) {
                cell = row.createCell(columnIndex);
                cell.setCellValue(map.get(key) + "");
                columnIndex++;
            }

        } else {
            /// only specified columns
            for (int i = 0, len = columns.length; i < len; i++) {
                cell = row.createCell(i);
                cell.setCellValue(map.get(columns[i]) == null ? "" : map.get(columns[i]) + "");
            }
        }
    }

}
