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


    @Test(threadPoolSize = 3,invocationCount = 3)
    public synchronized void testThredSafe(){

        System.out.println(Thread.currentThread().getId());
        counter++;
        System.out.println(counter);

    }

    public void run() {
        testThredSafe();
        System.out.println(this.counter);
    }



    @Test
    public void testStart(){
        ExecutorService executorService = Executors.newCachedThreadPool();
        executorService.submit(new ThredSafeTest());
        executorService.submit(new ThredSafeTest());
        executorService.submit(new ThredSafeTest());
//        executorService.
    }


}
