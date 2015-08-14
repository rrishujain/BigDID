/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

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
public class Customer_Feedback_Month_Controller {
    
    
     Feedback_Date FD = new Feedback_Date();
     int count[] =new int[6];
     
      public Customer_Feedback_Month_Controller() throws SQLException, UnknownHostException {
       
    }
    
    public long[][] feedback() throws SQLException, ParseException, UnknownHostException {
     
        long[][] feedbacks = new long[50][3];
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setTimeZone(TimeZone.getTimeZone("IST"));
        
        Calendar c = Calendar.getInstance();
        int CurrentMonthNumber =c.get(Calendar.MONTH);
        int CurrentYear = c.get(Calendar.YEAR);
        int MonthCounter=0;
        int diff =0;
        for (int i = 0; i < 124; i++) {
            
            MonthCounter= c.get(Calendar.MONTH);
            int YearCounter = c.get(Calendar.YEAR);
            diff = (CurrentMonthNumber+1)-(MonthCounter+1);
            if(YearCounter!=CurrentYear){
                diff= 12 +diff;
            }
            
            String date =c.getTime().toString();

             String d =date.substring(0,10);
            feedbacks = FD.getFeedback(d,diff,c.getTime());
            
            c.add(Calendar.DATE, -1);
          
        }
        return feedbacks;
    }
    
    
    
}
