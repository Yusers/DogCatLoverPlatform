/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;


/**
 *
 * @author overw
 */
public class Chat {

    private int id;
    private String topic;
    private String receiver_id;
    private String latest_message;
    private String lastest_sender;
    private Timestamp created_at;
    private Date updated_at;

    public Chat() {
    }

    public Chat(int id, String topic, String latest_message, String receiver_id, String lastest_sender, Timestamp created_at, Date updated_at) {
        this.id = id;
        this.topic = topic;
        this.latest_message = latest_message;
        this.receiver_id = receiver_id;
        this.lastest_sender = lastest_sender;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public String getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(String receiver_id) {
        this.receiver_id = receiver_id;
    }

    public String getLastest_message() {
        return latest_message;
    }

    public void setLastest_message(String lastest_message) {
        this.latest_message = lastest_message;
    }

    public String getLatest_message() {
        return latest_message;
    }

    public void setLatest_message(String lastest_message) {
        this.latest_message = lastest_message;
    }

    public String getLastest_sender() {
        return lastest_sender;
    }

    public void setLastest_sender(String lastest_sender) {
        this.lastest_sender = lastest_sender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public long getCreatedAtTime() {
        return created_at.getTime();
    }

    public String getFormattedCreatedAtTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
        return formatter.format(created_at.getTime());
    }

    @Override
    public String toString() {
        return "Chat{" + "id=" + id + ", topic=" + topic + ", receiver_id=" + receiver_id + ", latest_message=" + latest_message + ", lastest_sender=" + lastest_sender + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}
