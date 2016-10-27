package com.mio.testDemo;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.HashSet;

/**
 * Created by liuhe on 16/8/16.
 * update
 */
public class IntegerTest {


    @Test
    public void testIntegerCompare(){


        if (new Integer(1) == new Integer(1)){
            System.out.println("=");
        }
        if (new Integer(1) >new Integer(1)){
            System.out.println(">");
        }
        if (new Integer(1) <new Integer(1)){
            System.out.println("<");
        }

        System.out.println(new Integer(1));



        //compare integer and int


        Integer integer = new Integer(1);
        Integer b = null;
        int a =  1;

        if (integer == a){
            System.out.println("yes integer = a");
        }
        if (b == a){
            System.out.println("yes b = a");
        }


    }




    @Test
    public void stest(){


        ArrayList<String> strings = new ArrayList<>();

        strings.add(null);
        strings.add(null);

        System.out.println(strings.size());

        HashSet<String> set = new HashSet<>();

        set.add(null);
        set.add(null);

        System.out.println(set.size());

    }
}
