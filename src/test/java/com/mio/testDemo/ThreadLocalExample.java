package com.mio.testDemo;

import org.junit.Test;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by hel2 on 26/7/2016.
 */
public class ThreadLocalExample {

    public static class MyRunnable implements Runnable {


        private ThreadLocal<Integer> threadLocal = new ThreadLocal<Integer>();

        @Override
        public void run() {
            threadLocal.set( (int) (Math.random() * 100D) );
            try {

                Thread.sleep(2000);

            } catch (InterruptedException e) {

            }

            System.out.println(threadLocal.get());

        }

    }



    public static void main(String[] args) {

        MyRunnable sharedRunnableInstance = new MyRunnable();

        Thread thread1 = new Thread(sharedRunnableInstance);

        Thread thread2 = new Thread(sharedRunnableInstance);

        thread1.start();
        thread2.start();

        try {
            thread1.join(); //wait for thread 1 to terminate
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        try {
            thread2.join(); //wait for thread 2 to terminate
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }



    @Test
    public void testCAS(){
        final AtomicBoolean lock = new AtomicBoolean(false);

        lock.compareAndSet(true,false);

        System.out.println(lock.get());


        final AtomicInteger atomicInteger = new AtomicInteger();

        final int i = atomicInteger.addAndGet(1);

        final int andAdd = atomicInteger.getAndAdd(2);
        System.out.println(andAdd);
        System.out.println(atomicInteger.get());
//        System.out.println(i);


        final int andIncrement = atomicInteger.getAndIncrement();
        System.out.println(andIncrement);

        System.out.println(atomicInteger.getAndIncrement());
        System.out.println(atomicInteger.getAndIncrement());
        System.out.println(atomicInteger.getAndIncrement());
    }

}
