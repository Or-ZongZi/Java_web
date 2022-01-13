package com.jay.test;

import com.jay.bean.Admin;
import com.jay.dao.AdminManage;

import java.util.List;
import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        //数据添加
        AdminManage am = new AdminManage();
        am.insertAd();

        List<Admin> all = am.findAll();
        all.forEach(System.out::println);

        am.updateAd();

        am.deleteAd();

    }
}
