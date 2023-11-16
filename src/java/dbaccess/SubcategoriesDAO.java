/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbaccess;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import myutils.DBUtils;
import model.Subcategories;

/**
 *
 * @author overw
 */
public class SubcategoriesDAO {

    public static ArrayList<Subcategories> getAllSubcate() throws Exception {
        ArrayList<Subcategories> listSubcate = new ArrayList<>();

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Subcategories]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs!=null) {
                while(rs.next()) {
                    int id = rs.getInt("SubcategoryID");
                    int cate_id = rs.getInt("cate_id");
                    String name = rs.getString("SubcategoryName");
                    listSubcate.add(new Subcategories(id, cate_id, name));
                }
            }
        }

        return listSubcate;
    }
    
    public static ArrayList<Subcategories> getAllSubcateByCateID(int cate_id) throws Exception {
        ArrayList<Subcategories> listSubcate = new ArrayList<>();

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Subcategories]\n"
                    + "WHERE [cate_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, cate_id);
            ResultSet rs = pst.executeQuery();
            if(rs!=null) {
                while(rs.next()) {
                    int id = rs.getInt("SubcategoryID");
                    String name = rs.getString("SubcategoryName");
                    listSubcate.add(new Subcategories(id, cate_id, name));
                }
            }
        }

        return listSubcate;
    }
}
