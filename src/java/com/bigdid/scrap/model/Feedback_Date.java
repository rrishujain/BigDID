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
public class Feedback_Date{
    
      
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "bigdid_new" );
    private static DBCollection coll;   
            
    public long[][] feedbacks=new long[13][4];
    DBCursor obj;
    long count[]= new long[13];
    
    
    public Feedback_Date() throws SQLException, UnknownHostException {

        coll=db.getCollection("user_master_data");
    }
    
    public long[][] getFeedback(String date, int diff,Date datePassed) throws ParseException{
        String s;
        String s1;
      
        TimeZone tz = TimeZone.getTimeZone("UTC");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mmZ");
        df.setTimeZone(tz);
        datePassed = df.parse(df.format(datePassed));
        
        BasicDBObject condition=new BasicDBObject("Order_Date",datePassed);
        long totalCount= coll.count(condition);
        count[diff]=totalCount;
        
        
        BasicDBObject condition1=new BasicDBObject("Order_Date",datePassed).append("feedback", "Bad");
        long badCount= coll.count(condition1);
        feedbacks[diff][0]=badCount;
        
        
        BasicDBObject condition2=new BasicDBObject("Order_Date",datePassed).append("feedback", "Average");
        long averageCount= coll.count(condition2);
        feedbacks[diff][1]=averageCount;
        
        BasicDBObject condition3=new BasicDBObject("Order_Date",datePassed).append("feedback", "Good");
        long goodCount= coll.count(condition3);
        feedbacks[diff][2]=goodCount;
        
        BasicDBObject condition4=new BasicDBObject("Order_Date",datePassed).append("feedback", "Excellent");
        long excCount= coll.count(condition4);
        feedbacks[diff][3]=excCount;
   
   
        
        return feedbacks;
    }
    
}
