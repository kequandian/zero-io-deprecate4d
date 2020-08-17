package com.jfeat.pdf.pages.util;

import java.io.File;

public class StringUtils {

    private static final char FILE_SEPARATOR = '/';
    private static final char FILE_SEPARATOR_WINDOWS = '\\';

    public static String getBaseName(String filename) {
        return removeExtension(getName(filename));
    }

    public static String getName(String filename) {
        if(filename == null) {
            return null;
        } else {
            int index = indexOfLastSeparator(filename);
            return filename.substring(index + 1);
        }
    }

    public static int indexOfLastSeparator(String filename) {
        if (filename == null) {
            return -1;
        }
        return Math.max(filename.lastIndexOf(FILE_SEPARATOR_WINDOWS), filename.lastIndexOf(FILE_SEPARATOR));
    }


    /**
     * org.apache.commons.io.FilenameUtils version 2.4 gives the following answer
     */
    public static String removeExtension(String filename) {
        if (filename == null) {
            return null;
        }
        int index = indexOfExtension(filename);
        if (index == -1) {
            return filename;
        } else {
            return filename.substring(0, index);
        }
    }

    public static int indexOfExtension(String filename) {
        if (filename == null) {
            return -1;
        }
        int extensionPos = filename.lastIndexOf(EXTENSION_SEPARATOR);
        int lastSeparator = indexOfLastSeparator(filename);
        return lastSeparator > extensionPos ? -1 : extensionPos;
    }

    private static final char EXTENSION_SEPARATOR = '.';
}