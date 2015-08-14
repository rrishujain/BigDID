/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.scrap.model;

import com.bigdid.model.DBFactory;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 *
 * @author cignex
 */
public class Customer_Sentiment{
    
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "bigdid_new" );
    private static DBCollection coll;   
            
    public long[][] sentiments=new long[13][4];
    DBCursor obj;
    long count[]= new long[13];
    
    
    public Customer_Sentiment() throws SQLException, UnknownHostException {

        coll=db.getCollection("tweets_data_amazon");
    }
    public long[][] getSentimentWeek(String date, int diff,Date datePassed) throws ParseException{
        String s;
        String s1;
        
     
        Calendar c = Calendar.getInstance();
        
        c.setTime(datePassed);
        c.add(Calendar.HOUR, -5);
        c.add(Calendar.MINUTE, -30);
         
        s1=c.getTime().toString();
        String st=s1.substring(0,10);
        
             
        BasicDBObject condition=new BasicDBObject("date",st);
        long totalCount= coll.count(condition);
        count[diff]=totalCount;
        
        
        BasicDBObject condition1=new BasicDBObject("date",st).append("sentiment", "positive");
        long sentimentPositiveCount= coll.count(condition1);
        sentiments[diff][0]=sentimentPositiveCount;
        
        
        BasicDBObject condition2=new BasicDBObject("date",st).append("sentiment", "negative");
        long sentimentNegativeCount= coll.count(condition2);
        sentiments[diff][1]=sentimentNegativeCount;
        
   
        return sentiments;
    }
    
    public long[] getCount(){
        
        return count;
    }
    
}
