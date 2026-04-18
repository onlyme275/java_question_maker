package com.hero.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hero.model.Hero;
import com.utils.DbConnection;

public class HeroDao {

    public boolean addHero(Hero h) throws SQLException {

        String sql = "INSERT INTO hero(title, description, image) VALUES (?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, h.getTitle());
            ps.setString(2, h.getDescription());
            ps.setString(3, h.getImage());

            return ps.executeUpdate() > 0;
        }
    }

    public List<Hero> getHero() throws SQLException {

        List<Hero> list = new ArrayList<>();

        String sql = "SELECT * FROM hero";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Hero h = new Hero();
                h.setId(rs.getInt("id"));
                h.setTitle(rs.getString("title"));
                h.setDescription(rs.getString("description"));
                h.setImage(rs.getString("image"));

                list.add(h);
            }
        }

        return list;
    }
}