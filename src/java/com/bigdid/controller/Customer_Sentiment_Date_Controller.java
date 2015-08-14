package com.bigdid.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.bigdid.scrap.model.Customer_Sentiment;
import com.bigdid.scrap.model.Customer_Sentiment;
import com.mongodb.DB;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;

/**
 *
 * @author tanmay
 */
public class Customer_Sentiment_Date_Controller {

    Customer_Sentiment CS;
    long count[] =new long[6];
    Customer_Sentiment CSW = new Customer_Sentiment();
    
    public Customer_Sentiment_Date_Controller() throws SQLException, UnknownHostException {
        this.CS = new Customer_Sentiment();
    }

    public long[][] sentiments() throws SQLException, ParseException, UnknownHostException {
        long[][] sentiments = new long[50][3];
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
            sentiments = CSW.getSentimentWeek(d,diff,c.getTime());
            
            c.add(Calendar.DATE, -1);
        }
        return sentiments;
    }
    
    public long[] orders(){
        
        count= CSW.getCount();
        return count;
    }
    
    public String[] dates(){
        String dates[] =new String[5];
        int i;
        Calendar c = Calendar.getInstance();
        for(i=0;i<4;i++){
            String date =c.getTime().toString();
            String d =date.substring(0,10);
            dates[i]=d;
             c.add(Calendar.DATE, -1);
        }
        return dates;
    }

}
