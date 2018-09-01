/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Feedback;

/**
 *
 * @author Shashi Perera
 */
public interface IFeedbackService {
    
    public String updateFeedback(String fid,Feedback f);
	
	public boolean deleteFeedback(String fid);
	
	public boolean insertFeedback(Feedback f);
    
}
