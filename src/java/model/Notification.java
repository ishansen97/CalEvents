/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Shashi Perera
 */
public class Notification {
    
     
        private String nid;
	private String notify;
	private String userID;

        
        
    /**
     * @return the notify
     */
    public String getNotify() {
        return notify;
    }

    /**
     * @param notify the notify to set
     */
    public void setNotify(String notify) {
        this.notify = notify;
    }

    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }

    /**
     * @return the nid
     */
    public String getNid() {
        return nid;
    }

    /**
     * @param nid the nid to set
     */
    public void setNid(String nid) {
        this.nid = nid;
    }

        
}
