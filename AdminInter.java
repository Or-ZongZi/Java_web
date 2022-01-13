package com.jay.dao;

import com.jay.bean.Admin;

import java.util.List;

public interface AdminInter {
    public int insertAd();

    public List<Admin> findAll();

    public int updateAd();

    public int deleteAd();
}
