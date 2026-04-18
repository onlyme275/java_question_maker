package com.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.model.User;
import com.utils.DbConnection;

public class UserDao {

    public boolean insertUser(User user) throws SQLException {
        String query = "INSERT INTO users(username, age, address, email, password, is_staff)"+
                "VALUES(?,?,?,?,?,?)";
        try(Connection conn = DbConnection.getConnection();
            PreparedStatement st = conn.prepareStatement(query)
        ){
            st.setString(1,user.getUsername());
            st.setInt(2,user.getAge());
            st.setString(3,user.getAddress());
            st.setString(4,user.getEmail());
            st.setString(5,user.getPassword());
            st.setInt(6,user.getIs_staff());

            int insertedRows = st.executeUpdate();
            if(insertedRows>0){
                return true;
            }else{
                return false;
            }

        }
    }

    public User loginUser(String email, String password) throws SQLException {

    String sql = "SELECT * FROM users WHERE email=? AND password=?";

    try(Connection conn = DbConnection.getConnection();
        PreparedStatement st = conn.prepareStatement(sql)) {

        st.setString(1, email);
        st.setString(2, password);

        ResultSet rs = st.executeQuery();

        if(rs.next()){
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));

            user.setIs_staff(rs.getInt("is_staff"));

            return user;
        }
    } catch (SQLException e) {
        throw e;
    }
    return null;
}
}

