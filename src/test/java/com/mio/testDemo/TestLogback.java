package com.mio.testDemo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.Test;

/**
 * Created by hel2 on 28/7/2016.
 */
public class TestLogback {
    private final static Logger logger = LoggerFactory.getLogger(TestLogback.class);


    @Test
    public void testLogbackLog(){

        logger.info("info msg");
        logger.trace("trace msg");
        logger.error("error msg");
        logger.warn("warn msg");
        logger.debug("debug msg");


        System.out.println("done");
    }




}
