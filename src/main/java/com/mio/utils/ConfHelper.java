package com.mio.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by liuhe on 2016/10/27.
 * update
 */
public class ConfHelper {


    public static String getConfig(String property){

        Properties properties = new Properties();
        try {
            properties.load(ConfHelper.class.getClassLoader().getResourceAsStream("conf.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties.getProperty(property);
    }

    public static int getIntConfig(String property){
        String config = getConfig(property);

        return Integer.parseInt(config);
    }
}
