package com.mio.testDemo.spring;

import org.omg.CORBA.Object;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by liuhe on 16/8/8.
 * update
 */
public class SpringTestDemo {



    public void testSpring(){

        new ClassPathXmlApplicationContext("***.xml");


    }


}

class class1 implements ApplicationContextAware{

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

    }
}

class class2 implements FactoryBean<Object>{

    @Override
    public Object getObject() throws Exception {
        return null;
    }

    @Override
    public Class<?> getObjectType() {
        return null;
    }

    @Override
    public boolean isSingleton() {
        return false;
    }
}

class class3 implements BeanNameAware{

    @Override
    public void setBeanName(String s) {
        System.out.println(s);


        s.equals("");
    }
}

