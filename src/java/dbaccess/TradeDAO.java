/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbaccess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import myutils.DBUtils;
import model.Trade;

/**
 *
 * @author overw
 */
public class TradeDAO {

    public static ArrayList<Trade> getAllTrade() throws Exception {
        ArrayList<Trade> trades = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [author_id], [title], [content], [status], [category], [image], [created_at], [updated_at]\n"
                    + "FROM [dbo].[Trade]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String author_id = rs.getString("author_id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String status = rs.getString("status");
                    int category = rs.getInt("category");
                    String image = rs.getString("image");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    trades.add(new Trade(id, author_id, title, content, status, category, image));
                }
            }
            cn.close();
        }
        return trades;
    }
    
    public static Trade getTrade(int trade_id) throws Exception {
        Trade trade = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [author_id], [title], [content], [status], [category], [image], [created_at], [updated_at]\n"
                    + "FROM [dbo].[Trade]\n"
                    + "WHERE [id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, trade_id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String author_id = rs.getString("author_id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String status = rs.getString("status");
                    int category = rs.getInt("category");
                    String image = rs.getString("image");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    trade = new Trade(id, author_id, title, content, status, category, image);
                }
            }
            cn.close();
        }
        return trade;
    }
    
    public static boolean hasTrades(String author) throws Exception {
        boolean rs = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [dbo].[Trade]\n"
                    + "WHERE author_id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, author);
            ResultSet resultSet = pst.executeQuery();
            if (resultSet.next()) {
                int postCount = resultSet.getInt(1);
                rs = (postCount > 0);
            }
            cn.close();
        }
        return rs;
    }
    
    public static int deleteTrade(String author) throws Exception {
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "DELETE FROM [dbo].[Trade]\n"
                    + "WHERE [author_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, author);
            rs = pst.executeUpdate();
            cn.close();
        }
        return rs;
    }
}
