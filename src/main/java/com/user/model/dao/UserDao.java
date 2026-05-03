package com.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.user.model.User;
import com.utils.DbConnection;

public class UserDao {

    public boolean insertUser(User user) throws SQLException {

        String query = "INSERT INTO users(username, age, address, email, password, is_staff) VALUES(?,?,?,?,?,?)";

        try (Connection conn = DbConnection.getConnection(); PreparedStatement st = conn.prepareStatement(query)) {

            st.setString(1, user.getUsername());
            st.setInt(2, user.getAge());
            st.setString(3, user.getAddress());
            st.setString(4, user.getEmail());

            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
            st.setString(5, hashedPassword);

            st.setInt(6, user.getIs_staff());

            return st.executeUpdate() > 0;
        }
    }

    public User loginUser(String email, String password) throws SQLException {

        String sql = "SELECT * FROM users WHERE email=?";

        try (Connection conn = DbConnection.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {

            st.setString(1, email);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                String storedHash = rs.getString("password");

                // Check if password is valid (either BCrypt hash or plain-text for legacy accounts)
                boolean isPasswordValid = false;
                
                if (storedHash != null && storedHash.startsWith("$2")) {
                    // It's a BCrypt hash - verify it
                    isPasswordValid = BCrypt.checkpw(password, storedHash);
                } else {
                    // Legacy plain-text password or old format - compare directly
                    isPasswordValid = password.equals(storedHash);
                }

                if (isPasswordValid) {

                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setIs_staff(rs.getInt("is_staff"));

                    return user;
                }
            }
        }

        return null;
    }
}
