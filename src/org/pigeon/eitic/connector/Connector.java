package org.pigeon.eitic.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Connector {
    
    private static final String URL = "jdbc:mysql://localhost:3306/eitic";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "1230";
    
    public Connector() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("--链接数据库失败。" + e);
        }
    }
    
    public Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public void closeResultSet(ResultSet rs) {
        try {
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void closePreparedStatement(PreparedStatement ps) {
        try {
            ps.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
}
