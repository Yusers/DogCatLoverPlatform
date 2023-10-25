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
import model.Post;

/**
 *
 * @author overw
 */
public class PostDAO {

    public static ArrayList<Post> getAllPost() throws Exception {
        ArrayList<Post> posts = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [title], [category_id], [author_id], [content], [status], [rejected_reason], [created_at], [updated_at]\n"
                    + "FROM [dbo].[Post]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    int cate_id = rs.getInt("category_id");
                    String author_id = rs.getString("author_id");
                    String content = rs.getString("content");
                    String status = rs.getString("status");
                    String rejected_reason = rs.getString("rejected_reason");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    posts.add(new Post(id, title, cate_id, author_id, content, status, rejected_reason, created_at, updated_at));
                }
            }
            cn.close();
        }
        return posts;
    }

    public static Post getPost(int id) throws Exception {
        Post post = null;

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT *\n"
                    + "FROM [dbo].[Post]\n"
                    + "WHERE id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String title = rs.getString("title");
                    int cate_id = rs.getInt("category_id");
                    String author_id = rs.getString("author_id");
                    String content = rs.getString("content");
                    String status = rs.getString("status");
                    String rejected_reason = rs.getString("rejected_reason");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    post = new Post(id, title, cate_id, author_id, content, status, rejected_reason, created_at, updated_at);
                }
            }
        }

        return post;
    }

    public static int deletePost(String author) throws Exception {
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "DELETE FROM [dbo].[Post]\n"
                    + "WHERE [author_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, author);
            rs = pst.executeUpdate();
            cn.close();
        }
        return rs;
    }

    public static boolean hasPosts(String author) throws Exception {
        boolean rs = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT COUNT(*)\n"
                    + "FROM [dbo].[Post]\n"
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

    public static ArrayList<Post> getAllUserPosts(String author) throws Exception {
        ArrayList<Post> posts = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id],[title],[category_id],[author_id],[content],[status],[rejected_reason],[created_at],[updated_at]\n"
                    + "FROM [dbo].[Post] \n"
                    + "WHERE [author_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, author);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    int cate_id = rs.getInt("category_id");
                    String author_id = rs.getString("author_id");
                    String content = rs.getString("content");
                    String status = rs.getString("status");
                    String rejected_reason = rs.getString("rejected_reason");
                    Date created_at = rs.getDate("created_at");
                    Date updated_at = rs.getDate("updated_at");
                    posts.add(new Post(id, title, cate_id, author_id, content, status, rejected_reason, created_at, updated_at));
                }
            }
            cn.close();
        }
        return posts;
    }
}
