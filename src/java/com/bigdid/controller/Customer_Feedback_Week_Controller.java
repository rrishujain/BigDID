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
public class Customer_Feedback_Week_Controller {
    
        
   int count[] =new int[6];
   Feedback_Date CF = new Feedback_Date(); 
   
   public Customer_Feedback_Week_Controller() throws SQLException, UnknownHostException {
       
    }
    public long[][] feedback() throws SQLException, ParseException, UnknownHostException {
        
        
        long[][] feedback = new long[50][3];
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("IST"));
        
        Calendar c = Calendar.getInstance();
       
        int CurrentWeekNumber =c.get(Calendar.WEEK_OF_YEAR);
        int CurrentYear = c.get(Calendar.YEAR);
        int WeekCounter=0;
        int diff =0;
        for (int i = 0; i < 30; i++) {
            
            WeekCounter= c.get(Calendar.WEEK_OF_YEAR);
            diff = CurrentWeekNumber-WeekCounter;
            int YearCounter = c.get(Calendar.YEAR);
            if(YearCounter!=CurrentYear){
                diff = 52 + diff;
            }
            
            String date =c.getTime().toString();
            String d =date.substring(0,10);
            feedback= CF.getFeedback(d,diff,c.getTime());
           
            c.add(Calendar.DATE, -1);
        }
        return feedback;
    }
    
}
