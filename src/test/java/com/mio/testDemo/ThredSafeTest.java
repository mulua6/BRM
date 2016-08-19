package com.mio.testDemo;

import org.testng.annotations.Test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Created by liuhe on 16/7/27.
 * update
 */
public class ThredSafeTest implements Runnable {

    private int counter = 0;


//    @Test(threadPoolSize = 3,invocationCount = 3)
    public synchronized void testThredSafe(){

        System.out.println(Thread.currentThread().getId());
        counter++;
        System.out.println(counter);

    }

    public void run() {
//        testThredSafe();
        System.out.println(Thread.currentThread().getId());
        try {
            System.out.println("begin sleep");
            Thread.sleep(2000);
            System.out.println("end sleep");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }



    @Test
    public void testStart(){
        ExecutorService executorService = Executors.newCachedThreadPool();
        executorService.submit(new ThredSafeTest());
        executorService.submit(new ThredSafeTest());
        executorService.submit(new ThredSafeTest());
    }


    public static void main(String[] args) throws Exception {

        ThredSafeTest t1 = new ThredSafeTest();

//        ExecutorService es = Executors.newCachedThreadPool();
//
//        es.execute(t1);


        Thread thread = new Thread(t1);

        thread.start();
        thread.join(3000);

        System.out.println(Thread.currentThread().getId());



    }



    }
