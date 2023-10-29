/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbaccess;
import java.sql.Connection;
import model.Comment;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;
import myutils.DBUtils;

/**
 *
 * @author overw
 */
public class CommentDAO {
    public static ArrayList<Comment> getAllComment(int posts_id) throws Exception {
        ArrayList<Comment> list = new ArrayList<>();
        
        Connection cn = DBUtils.makeConnection();
        if(cn!=null) {
            String sql = "SELECT * FROM [dbo].[Comment] WHERE [post_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, posts_id);
            ResultSet rs = pst.executeQuery();
            if(rs != null) {
                while(rs.next()) {
                    int id = rs.getInt("id");
                    String author_id = rs.getString("author_id");
                    int post_id = rs.getInt("post_id");
                    String content = rs.getString("content");
                    int parent_id = rs.getInt("parent_id");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    list.add(new Comment(id, author_id, post_id, content, parent_id, created_at, updated_at));
                }
            }
            cn.close();
        }
        
        return list;
    }
}
