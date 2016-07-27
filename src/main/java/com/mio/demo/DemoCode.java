package com.mio.demo;

import com.google.common.collect.Lists;
import org.testng.annotations.Test;

import java.util.ArrayList;

/**
 * Created by liuhe on 6/24/16.
 * update
 */
@Test
public class DemoCode {

    @Test
    public void demoTest(){
        ArrayList<Student> students = Lists.newArrayList();

        Student student = new Student();
        student.setId(null);
        student.setName("jim");

        students.add(student);

        int id = 0;
        for (Student s:students){
            id = s.getId();//#1
        }
    }

}
class Student {
    Integer id;
    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}