
import dbaccess.ConversationDAO;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import model.Message;
import dbaccess.MessageDAO;
import java.util.HashMap;
import java.util.HashSet;
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
@ServerEndpoint("/chat")
public class ChatController {

    private static Set<Session> userSessions = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static Map<String, Set<Session>> rooms = new HashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("room") String roomName) {
        // Add the user to the appropriate room based on the passed roomName
        rooms.computeIfAbsent(roomName, k -> new HashSet<>()).add(session);
    }

    @OnClose
    public void onClose(Session session) {
        // Remove the user from all rooms upon disconnecting
        rooms.values().forEach(room -> room.remove(session));
    }

    @OnMessage
    public void onMessage(String message, Session userSession) {
        String[] messageParts = message.split(":");

        try {
            if (messageParts.length == 2) {
                String topic = getRoomName(rooms);
                String content = messageParts[1];

                String[] topicParts = topic.split("\\|");

                if (topicParts.length == 3) {
                    String receiverId = topicParts[1].trim(); // Receiver ID
                    String senderId = topicParts[2].trim(); // Sender ID

                    int conversationId = ConversationDAO.getConversation(topic).getId(); // Implement your method to get conversation ID

                    Message newMessage = new Message(senderId, receiverId, content, conversationId);
                    MessageDAO.createMessage(newMessage);

                    broadcast(message);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void broadcast(String message) {
        for (Session session : userSessions) {
            if (session.isOpen()) {
                try {
                    session.getBasicRemote().sendText(message);
                } catch (Exception e) {
                    // Handle exception (log or ignore)
                }
            }
        }
    }

    private String getRoomName(Session session) {
        // Get the room name associated with the user session
        for (Map.Entry<String, Set<Session>> entry : rooms.entrySet()) {
            if (entry.getValue().contains(session)) {
                return entry.getKey();
            }
        }
        return "default"; // Return default room if not found
    }

    // Method to retrieve conversation ID based on topic (customize this according to your logic)
    private int getConversationIdForTopic(String topic) {
        // Implement your logic to retrieve conversation ID from the topic
        // For example, querying the database or using a mapping
        return 0; // Replace with the actual conversation ID
    }
}
