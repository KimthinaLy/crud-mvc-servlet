/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.*;
import util.DBUtil;

/**
 *
 * @author Admin
 */
public class UserDAOImpl implements UserDAO {

    @Override
    public User login(String username, String password) throws Exception {
        User user = new User();
        String sql = "SELECT id, username, role FROM users WHERE username=? AND password=?";

        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                return user;
            }
        }
        return null;
    }

    @Override
    public boolean register(User user) throws Exception{
        String sql = "INSERT INTO users (id,username, password, role) VALUES (?,?, ?, ?)";
        
        try(Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1, user.getId());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            
            return ps.executeUpdate() > 0;
        }
    }
}
