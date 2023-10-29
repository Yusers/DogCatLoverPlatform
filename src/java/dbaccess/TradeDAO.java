/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbaccess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import model.Trade;
import myutils.DBUtils;

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
}
