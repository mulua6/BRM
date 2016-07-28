package com.mio.testDemo;

import org.junit.Test;

/**
 * Created by hel2 on 11/7/2016.
 */

public class TestOver {

    @Test
    public void testConTo(){
        B b = new B();

        b.to();
    }


}


class A{
    A(){
        System.out.println("A -con");
        to();
    }


    public void to(){
        System.out.println("A --to");
    }


}

class B extends A{
    B(){
        System.out.println("B --con");
    }

    @Override
    public void to(){
        System.out.println("B --to");
    }

}
