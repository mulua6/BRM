package com.mio.testDemo;

import org.testng.annotations.Test;

import java.util.ArrayList;

/**
 * Created by liuhe on 2016/10/5.
 * update
 */
public class TestList {

    @Test
    public void testList(){

        ArrayList<String> strings = new ArrayList<>();

//        strings.add(null);

        System.out.println(strings.isEmpty());
        System.out.println(strings.size());


    }




}
