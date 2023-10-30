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
import model.Conversation;

/**
 *
 * @author overw
 */
public class ConversationDAO {

    public static Conversation getConversation(String topic) throws Exception {
        Conversation conversation = null;

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [topic], [created_at], [updated_at]\n"
                    + "FROM [dbo].[Conversation]\n"
                    + "WHERE [topic] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, topic);
            ResultSet rs = pst.executeQuery();
            if(rs != null) {
                while(rs.next()) {
                    int id = rs.getInt("id");
                    Date created_at = rs.getDate("created_at");
                    conversation = new Conversation(id, topic, created_at);
                }
            }
            cn.close();
        }

        return conversation;
    }
    
    public static int getConversationID(String topic) throws Exception {
        Conversation conversation = null;

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [created_at]"
                    + "FROM [dbo].[Conversation]\n"
                    + "WHERE [topic] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, topic);
            ResultSet rs = pst.executeQuery();
            if(rs != null) {
                while(rs.next()) {
                    int id = rs.getInt("id");
                    Date created_at = rs.getDate("created_at");
                    conversation = new Conversation(id, topic, created_at);
                }
            }
            cn.close();
        }

        return conversation.getId();
    }
    
    public static String getConversationTopic(int id) throws Exception {
        Conversation conversation = null;

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [topic], [created_at]"
                    + "FROM [dbo].[Conversation]\n"
                    + "WHERE [id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs != null) {
                while(rs.next()) {
                    String topic = rs.getString("topic");
                    Date created_at = rs.getDate("created_at");
                    conversation = new Conversation(id, topic, created_at);
                }
            }
            cn.close();
        }

        return conversation.getTopic();
    }
    
    public static int createConversation(String topic) throws Exception {
        int rs = 0;
        
        Connection cn = DBUtils.makeConnection();
        if(cn!=null) {
            String sql = "INSERT INTO [dbo].[Conversation] ([topic]) VALUES (?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, topic);
            rs = pst.executeUpdate();
        }
        
        return rs;
    }
}
