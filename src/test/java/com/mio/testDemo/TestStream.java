package com.mio.testDemo;

import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.Test;

import java.util.ArrayList;

/**
 * Created by hel2 on 28/7/2016.
 */
public class TestStream {

    private static Logger logger = LoggerFactory.getLogger(TestStream.class);

    @Test
    public void testStream(){


        final ArrayList<Integer> ids = Lists.newArrayList();

        ids.add(1);
        ids.add(2);
        ids.add(3);
        ids.add(4);
        ids.add(5);
        ids.add(6);
        ids.add(7);
        ids.add(8);


        ids.stream().forEach(id ->
        {
            System.out.println(id);
            System.out.println(Thread.currentThread().getName()+"----"+Thread.currentThread().getId());
        });

        System.out.println("-------------------------分割线------------------------------");
        ids.parallelStream().forEach(id ->
        {
            System.out.println(id);
            System.out.println(Thread.currentThread().getName()+"----"+Thread.currentThread().getId());
            logger.info(Thread.currentThread().getId()+"");
        });


    }



}
