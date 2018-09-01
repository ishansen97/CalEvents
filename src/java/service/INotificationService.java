/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import model.Notification;

/**
 *
 * @author Shashi Perera
 */
public interface INotificationService {
    
    public String updateNotification(String nid,Notification n);
	
	public boolean deleteNotification(String nid);
	
	public boolean insertNotification(Notification n);
    
}
