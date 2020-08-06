package com.jfeat.pdf.pages.util;

import java.io.File;

/**
 * Created by vincent on 2018/5/15.
 */
public class FilePathExtention {
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

    public static int indexOfLastSeparator(String filename) {
        if (filename == null) {
            return -1;
        }
        return filename.lastIndexOf(File.separator);
    }

    private static final char EXTENSION_SEPARATOR = '.';
}
