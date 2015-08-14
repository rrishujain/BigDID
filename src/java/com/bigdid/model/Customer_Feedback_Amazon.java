/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

import java.net.UnknownHostException;

/**
 *
 * @author cignex
 */
public class Customer_Feedback_Amazon {
    
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    
    public Customer_Feedback_Amazon() throws UnknownHostException{
        
        coll=db.getCollection("tweets_data_amazon");
        
    }
    public long[] getSentiments(){
    	 long count[]= new long[4];
    	
    	 BasicDBObject condition=new BasicDBObject("sentiment","positive");
         long range1Count= coll.count(condition);
         count[0]=range1Count;
         
         BasicDBObject condition1=new BasicDBObject("sentiment","negative");
         long range2Count= coll.count(condition1);
         count[1]=range2Count;
        
         BasicDBObject condition2=new BasicDBObject("sentiment","neutral");
         long range3Count= coll.count(condition2);
         count[2]=range3Count;
        
       
         return count;
    }
}
