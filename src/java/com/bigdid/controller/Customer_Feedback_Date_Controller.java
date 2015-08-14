/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Customer_Feedback;
import com.bigdid.scrap.model.Customer_Sentiment;
import com.bigdid.scrap.model.Feedback_Date;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

/**
 *
 * @author cignex
 */
public class Customer_Feedback_Date_Controller {
      
    int count[] =new int[6];
    
    Feedback_Date CSD = new Feedback_Date();
   
            
    public Customer_Feedback_Date_Controller() throws SQLException, UnknownHostException {
    
    }

    public long[][] feedback() throws SQLException, ParseException, UnknownHostException {
        long[][] feedbacks = new long[50][3];
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        

        Calendar c = Calendar.getInstance();
        int CurrentDateNumber =c.get(Calendar.DAY_OF_YEAR);
        int CurrentYear = c.get(Calendar.YEAR);
        int DateCounter=0, diff=0;
        
        for (int i = 0; i < 10; i++) {
            
            DateCounter= c.get(Calendar.DAY_OF_YEAR);
            int YearCounter = c.get(Calendar.YEAR);
            diff = CurrentDateNumber-DateCounter;
            if(YearCounter!=CurrentYear){
                diff= 365+diff;
            }
            String date =c.getTime().toString();
            String d =date.substring(0,10);
            feedbacks = CSD.getFeedback(d,diff,c.getTime());
            
            c.add(Calendar.DATE, -1);
        }
        return feedbacks;
    }
}
    

