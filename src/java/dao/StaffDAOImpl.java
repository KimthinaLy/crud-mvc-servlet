/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Staff;
import util.DBUtil;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class StaffDAOImpl implements StaffDAO {

    @Override
    public Staff checkStaffEmail(String email) throws Exception {
        
        Staff s = new Staff();
        
        String sql = "SELECT * FROM staff WHERE email=?";

        try (Connection con = DBUtil.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs =  ps.executeQuery();
            
            if(rs.next()){
                s.setId(rs.getInt("staff_id"));
                s.setEmail(rs.getString("email"));
                return s;
            }
        }
        return null;
    }
}
