package com.about.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.about.model.About;
import com.utils.DbConnection;

public class AboutDao {

    public boolean addAbout(About a) throws SQLException {

        String sql = "INSERT INTO about(name, description, image) VALUES (?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, a.getName());
            ps.setString(2, a.getDescription());
            ps.setString(3, a.getImage());

            return ps.executeUpdate() > 0;
        }
    }

    public List<About> getAbout() throws SQLException {

        List<About> list = new ArrayList<>();

        String sql = "SELECT * FROM about";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                About a = new About();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setDescription(rs.getString("description"));
                a.setImage(rs.getString("image"));

                list.add(a);
            }
        }

        return list;
    }
}
