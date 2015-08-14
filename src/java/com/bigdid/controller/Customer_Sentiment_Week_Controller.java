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
import java.util.Date;
import java.util.TimeZone;

/**
 *
 * @author cignex
 */
public class Customer_Sentiment_Week_Controller {
    
    
	long count[] =new long[6];
   Customer_Sentiment CSW = new Customer_Sentiment(); 
   
   public Customer_Sentiment_Week_Controller() throws SQLException, UnknownHostException {
       
    }
    public long[][] sentiments() throws SQLException, ParseException, UnknownHostException {
        
        
    	long[][] sentiments = new long[50][3];
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
            sentiments = CSW.getSentimentWeek(d,diff,c.getTime());
           
            c.add(Calendar.DATE, -1);
        }
        return sentiments;
    }
    public long[] orders(){
        count = CSW.getCount();
        return count;
    }
   
}
