package controllers;

import dbaccess.ConversationDAO;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import model.Message;
import model.Conversation;
import dbaccess.MessageDAO;
import jakarta.websocket.CloseReason;
import jakarta.websocket.server.PathParam;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Learn new here
 */
@ServerEndpoint("/chat/{topic}/{sender}")
public class ChatController {

    private static Set<Session> userSessions = Collections.newSetFromMap(new ConcurrentHashMap<Session, Boolean>());

    @OnOpen
    public void onOpen(Session curSession) {
        // Use roomName as needed
        userSessions.add(curSession);
    }

    @OnClose
    public void onClose(Session session) {
        // Remove the user from all rooms upon disconnecting
        userSessions.remove(session);
    }

    @OnMessage
    public void onMessage(String message, Session userSession) {
        System.out.println("Received message: " + message);

        String[] messageParts = message.split(": ");
        System.out.println("messageParts[0]: " + messageParts[0]);;
        System.out.println("messageParts[1]: " + messageParts[1]);
        System.out.println("messageParts[2]: " + messageParts[2]);;
        System.out.println("length: " + messageParts.length);
        try {
            if (messageParts.length > 2) {
                String roomName = messageParts[2];
                System.out.println("Message received in room: " + roomName);

                String content = messageParts[1];

                int conversationId = Integer.parseInt(roomName.trim()); // Implement your method to get conversation ID
                Conversation con = ConversationDAO.getConversation(conversationId);
                System.out.println("name room: " + con.getTopic());
                String[] topicParts = con.getTopic().split("\\|");

                // Trim the spaces from the extracted parts
                String receiverId = topicParts[1].trim();
                String senderId = topicParts[2].trim();
                System.out.println("Receiver: " + receiverId);
                System.out.println("Sender: " + senderId);
                System.out.println("Logic: senderRealTime: " + (messageParts[0].equals(senderId.trim()) ? senderId : receiverId) + " receiverRealtime: " + (messageParts[0].equals(senderId.trim()) ? receiverId : senderId));
                System.out.println("Conversation ID: " + conversationId);
                String senderRealTime = (messageParts[0].equals(senderId.trim()) ? senderId : receiverId);
                String receiverRealTime = (messageParts[0].equals(senderId.trim()) ? receiverId : senderId);
                Message newMessage = new Message(senderRealTime, receiverRealTime, content, conversationId);
                MessageDAO.createMessage(newMessage);
                System.out.println(messageParts[0].concat(": " + messageParts[1]));
                broadcast(messageParts[0].concat(": " + messageParts[1]), userSession);
                System.out.println("Message broadcasted");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void broadcast(String message, Session userSession) {
        for (Session ses : userSessions) {
            ses.getAsyncRemote().sendText(message);
        }
    }
}
