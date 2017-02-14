package com.mio.utils;

import com.beust.jcommander.internal.Lists;
import com.beust.jcommander.internal.Maps;
import com.mio.domain.Card;
import com.mio.domain.Status;
import com.mio.service.CardService;
import com.mio.service.impl.CardServiceImpl;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liuhe on 2017/2/2.
 * update
 */
public class DataDictUtils {


    static {


        //设置读者状态信息
        /**
         * 0:正常
         * 1:挂失
         * 2:逾期
         */
        ArrayList<Status> statusList = new ArrayList<>();
        statusList.add(new Status(0,"正常"));
        statusList.add(new Status(1,"挂失"));
        statusList.add(new Status(2,"逾期"));

        //设置图书状态信息
        /**
         * 0:正常
         * 1:丢失
         * 2:损坏
         * 3:外借
         */
        ArrayList<Status> bookStatusList = new ArrayList<>();
        bookStatusList.add(new Status(0,"正常"));
        bookStatusList.add(new Status(1,"丢失"));
        bookStatusList.add(new Status(2,"损坏"));
        bookStatusList.add(new Status(3,"外借"));

        //设置性别
        /**
         * 1:男
         * 2:女
         */
        HashMap<Integer, String> sexList = new HashMap<>();
        sexList.put(0,"女");
        sexList.put(1,"男");


    }


    public static String parseCustomerStatus(Integer index){


        Map<Integer, String> customerStatus = Maps.newHashMap();
        customerStatus.put(0,"正常");
        customerStatus.put(1,"挂失");
        customerStatus.put(2,"逾期");


        return customerStatus.get(index);
    }

    public static List<Map<String, String>> getAllCustomerStatus(){


        List status = Lists.newArrayList();

        status.add(Maps.newHashMap("id","0","statusName","正常"));
        status.add(Maps.newHashMap("id","1","statusName","挂失"));
        status.add(Maps.newHashMap("id","2","statusName","逾期"));

        return status;
    }

    public static String parseBookStatus(Integer index){

        Map<Integer, String> bookStatus = Maps.newHashMap();
        bookStatus.put(0,"正常");
        bookStatus.put(1,"丢失");
        bookStatus.put(2,"损坏");
        bookStatus.put(3,"外借");


        return bookStatus.get(index);
    }
    public static String parseSex(Integer index){

        Map<Integer, String> sexList = Maps.newHashMap();
        sexList.put(0,"女");
        sexList.put(1,"男");


        return sexList.get(index);
    }
    public static String parseCard(Integer index){

        CardServiceImpl cardService = new CardServiceImpl();

        List<Card> allCards = cardService.findAllCards();

        System.out.println(allCards.size());

        Map<Integer, String> sexList = Maps.newHashMap();
        sexList.put(0,"女");
        sexList.put(1,"男");


        return sexList.get(index);
    }



}
