/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.scrap.model.Customer_Sentiment;
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
public class Customer_Sentiment_Month_Controller {
    
     Customer_Sentiment CSM = new Customer_Sentiment();
     long count[] =new long[6];
     
      public Customer_Sentiment_Month_Controller() throws SQLException, UnknownHostException {
       
    }
    
    public long[][] sentiments() throws SQLException, ParseException, UnknownHostException {
        

    	long[][] sentiments = new long[50][3];
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
            sentiments = CSM.getSentimentWeek(d,diff,c.getTime());
            
            c.add(Calendar.DATE, -1);
          
        }
        return sentiments;
    }
    
     public long[] orders(){
        count = CSM.getCount();
        return count;
    }
     
    public int[] months(){
        int months[] =new int[5];
        int i;
        Calendar c = Calendar.getInstance();
        
        for(i=0;i<4;i++){
            months[i]=c.get(Calendar.MONTH) +1;
            c.add(Calendar.MONTH, -1);
        }
        return months;
    }
     
     
    
}
