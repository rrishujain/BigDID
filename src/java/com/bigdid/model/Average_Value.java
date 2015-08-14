package com.bigdid.model;


import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cignex
 */
public class Average_Value{
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
   
    
    public Average_Value() throws UnknownHostException{
    
        coll=db.getCollection("user_master_data");

    }
    
    
    public long[] getBreakup() throws UnknownHostException{
      
         long item[] = new long[5];
       
        BasicDBObject condition=new BasicDBObject("$gte",1).append("$lt", 2000);
        BasicDBObject whereQuery = new BasicDBObject("Order_Value",condition);
        long range1Count= coll.count(whereQuery);
        item[0]=range1Count;
        
       
        BasicDBObject condition1=new BasicDBObject("$gte",2001).append("$lt", 4000);
        BasicDBObject whereQuery1 = new BasicDBObject("Order_Value",condition1);
        long range2Count= coll.count(whereQuery1);
        item[1]=range2Count;
       
        BasicDBObject condition2=new BasicDBObject("$gte",4001).append("$lt", 7000);
        BasicDBObject whereQuery2 = new BasicDBObject("Order_Value",condition2);
        long range3Count= coll.count(whereQuery2);
        item[2]=range3Count;
        
        
        BasicDBObject condition3=new BasicDBObject("$gte",7001).append("$lt", 10000);
        BasicDBObject whereQuery3 = new BasicDBObject("Order_Value",condition3);
        long range4Count= coll.count(whereQuery3);
        item[3]=range4Count;
         
              
        return item;
    }
}
