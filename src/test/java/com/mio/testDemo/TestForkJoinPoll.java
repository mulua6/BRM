package com.mio.testDemo;

import org.testng.annotations.Test;

import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveAction;
import java.util.concurrent.TimeUnit;

/**
 * Created by hel2 on 28/7/2016.
 */
public class TestForkJoinPoll {


    public class Task extends RecursiveAction {

        @Override
        protected void compute() {
            try {
                Thread.sleep(5);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }


            final Task task1 = new Task();
            final Task task2 = new Task();
            invokeAll(task1,task2);

            System.out.println(Thread.currentThread().getName());
        }
    }

    @Test
    public void testpool(){

        final ForkJoinPool forkJoinPool = new ForkJoinPool();

        final Task task = new Task();

        forkJoinPool.execute(task);


        do {
            System.out.printf("Main: Thread Count: %d\n",forkJoinPool.getActiveThreadCount());
            System.out.printf("Main: Thread Steal: %d\n",forkJoinPool.getStealCount());
            System.out.printf("Main: Parallelism: %d\n",forkJoinPool.getParallelism());
            try {
                TimeUnit.MILLISECONDS.sleep(5);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (!task.isDone());



    }
}
