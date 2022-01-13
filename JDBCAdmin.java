package com.jay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCAdmin {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection con(){
        try {
            return DriverManager.getConnection("jdbc:mysql:///newsdb_7", "root", "root");
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
