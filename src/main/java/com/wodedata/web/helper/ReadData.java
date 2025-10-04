package com.wodedata.web.helper;

import org.apache.commons.io.IOUtils;

import java.io.*;

/**
 * Created by luowei on 16/3/28.
 */
public class ReadData {


    /**
     * 从文件中读取Daytip
     *
     * @return
     */
    public static synchronized String readTipsFromFile(String fileName) {
        FileInputStream inputStream = null;
        try {
//            String content = new String(Files.readAllBytes(Paths.get(fileName)));

//            String contents = FileUtils.readFileToString(new File(getStringFromResourceFile(fileName)), "UTF-8");

            File file = new File(getStringFromResourceFile(fileName));
            inputStream = new FileInputStream(file);
            String content = IOUtils.toString(inputStream,"UTF-8");

            return content;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage(), e);
        } finally {
            close(inputStream);
        }
    }

    public static String getStringFromResourceFile(String fileName) {
        String configFilePath = ReadData.class.getClassLoader().getResource(fileName).getPath().substring(1);
        // 判断系统 linux，windows
        if ("\\".equals(File.separator)) {
            configFilePath = configFilePath.replace("%20", " ");
        } else if ("/".equals(File.separator)) {
            configFilePath = "/" + configFilePath.replace("%20", " ");
        }
        return configFilePath;
    }

    public static Boolean close(Closeable closeable) {
        try {
            if (closeable != null) {
                closeable.close();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage(), e);
        }
    }

}
