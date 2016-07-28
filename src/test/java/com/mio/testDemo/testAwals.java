package com.mio.testDemo;

import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 * Created by hel2 on 19/2/16.
 */
@Test(groups = "dd")
public class testAwals {

//    @BeforeClass(alwaysRun = false)
//    public void testB(){
//        System.out.println("before class1");
//    }
//    @BeforeClass
//    public void testB1(){
//        System.out.println("before class2");
//    }
//    @BeforeClass(alwaysRun = true)
//    public void testB2(){
//        System.out.println("before class3");
//    }
//    @Test
//    public void testDef(){
//        System.out.println("test method");
//    }



    @Test
    public void testRunTime(){

        System.out.println("running ######");
        callMethod();
        System.out.println("after call me");
    }

    @BeforeMethod
    public void bef(){
        System.out.println("berofe me");
    }
    @AfterMethod
    public void af(){
        System.out.println("after me");
    }
    @AfterClass
    public void afc(){
        System.out.println("after class");
    }
    private void callMethod(){
        System.out.println("call me");
        throw new  RuntimeException("eeee");
    }


    public void debugTest(){
        boolean flag = false;

        System.out.println(flag);

    }

}

