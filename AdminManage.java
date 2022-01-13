package com.jay.dao;

import com.jay.bean.Admin;
import com.jay.util.JDBCAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminManage implements AdminInter{

    @Override
    public int insertAd() {
        String sql = "INSERT admin VALUES(0,'admin_1','123456'),(0,'admin_2','654321')," +
                "(0,'admin_3','abcdegf');";
        Connection con = JDBCAdmin.con();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            int i = ps.executeUpdate();
            System.out.println("插入"+i+"条记录，");
            System.out.println("数据添加成功！");
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Admin> findAll() {
        ArrayList<Admin> list = new ArrayList<>();
        String sql = "SELECT * FROM admin;";
        Connection con = JDBCAdmin.con();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet re = ps.executeQuery();
            while (re.next()){
                Admin admin = new Admin(re.getInt(1), re.getString(2), re.getString(3));
                list.add(admin);
            }
            return list;

        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public int updateAd() {
        String sql = "UPDATE admin SET adminPwd='66699' WHERE adminName='admin_3';";
        Connection con = JDBCAdmin.con();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            int i = ps.executeUpdate();
            System.out.println("更新"+i+"条数据"+"\n数据更新成功！");
            return i;
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteAd() {
        String sql = "DELETE FROM admin WHERE adminId=2;";
        Connection con = JDBCAdmin.con();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            int i = ps.executeUpdate();
            System.out.println("删除"+i+"条记录\n数据删除成功！");
            return i;
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }
}
