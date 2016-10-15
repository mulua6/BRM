package com.mio.demo;

import org.testng.annotations.Test;
import org.testng.mustache.VariableChunk;

import java.util.HashMap;

/**
 * Created by liuhe on 16/9/17.
 * update
 */
public class testMap {



    @Test
    public void tmap(){

        String key = "1";
        String value = "1";


        HashMap<String, String> map = new HashMap<>();
        map.put(key,value);


        key = "2";
        value = "2";

        System.out.println(map.get("1"));


        data data = new data();

        HashMap<String, String> map1 = data.getMap();

        data.getMap().remove("name");

        System.out.println(map1.get("name"));


    }

}

class data{



    public String name = "1";
    public HashMap<String, String> map;

    data(){
        map = new HashMap<>();

        map.put("name",name);

    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public HashMap<String, String> getMap() {
        return map;
    }

    public void setMap(HashMap<String, String> map) {
        this.map = map;
    }
}
