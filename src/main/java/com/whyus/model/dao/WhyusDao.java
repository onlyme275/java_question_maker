package com.whyus.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.whyus.model.Whyus;
import com.utils.DbConnection;

public class WhyusDao {

    public boolean addWhyus(Whyus w) throws SQLException {

        String sql = "INSERT INTO whyus(title, description, image) VALUES (?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, w.getTitle());
            ps.setString(2, w.getDescription());
            ps.setString(3, w.getImage());

            return ps.executeUpdate() > 0;
        }
    }

    public List<Whyus> getWhyus() throws SQLException {

        List<Whyus> list = new ArrayList<>();

        String sql = "SELECT * FROM whyus";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Whyus w = new Whyus();
                w.setId(rs.getInt("id"));
                w.setTitle(rs.getString("title"));
                w.setDescription(rs.getString("description"));
                w.setImage(rs.getString("image"));

                list.add(w);
            }
        }

        return list;
    }
}
