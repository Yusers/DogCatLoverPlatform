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
import model.Message;

/**
 *
 * @author overw
 */
public class MessageDAO {

    public static ArrayList<Message> getAllMessage(int conversation_id) throws Exception {
        ArrayList<Message> list = new ArrayList<>();

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "SELECT [id], [sender_id], [receiver_id], [content], [conversation_id], [created_at]\n"
                    + "FROM [dbo].[Message]\n"
                    + "WHERE [conversation_id] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, conversation_id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String sender_id = rs.getString("sender_id");
                    String receiver_id = rs.getString("receiver_id");
                    String content = rs.getString("content");
                    Date created_at = rs.getDate("created_at");
                    list.add(new Message(id, sender_id, receiver_id, content, conversation_id, created_at));
                }
            }
            cn.close();
        }

        return list;
    }

    public static int createMessage(Message mess) throws Exception {
        int rs = 0;

        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "INSERT INTO [dbo].[Message] ([sender_id], [receiver_id], [content], [conversation_id])\n"
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, mess.getSender_id());
            pst.setString(2, mess.getReceiver_id());
            pst.setString(3, mess.getContent());
            pst.setInt(4, mess.getConversation_id());
            rs = pst.executeUpdate();
        }

        return rs;
    }
}
