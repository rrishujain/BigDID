/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author cignex
 */
public class counters{
 
    int count;
     
    private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    public counters() throws UnknownHostException{
        
    }
    public int getFeedbackCount(){
        coll=db.getCollection("user_feedback_data");     
        count= coll.find().count();
        return count;
    }
    
    public int getOrderCount(){
       
        coll=db.getCollection("user_master_data");
        count= coll.find().count();
        return count;
    }
    
    public int getSocialImpressionsCount(){
        
        coll=db.getCollection("tweets_data_amazon");
        count= coll.find().count();
        return count;
        
    }
    
    public long getRevenueTotal(){
              
          List a =new ArrayList<String>();
            
        
         // Now the $group operation
        DBObject groupFields = new BasicDBObject( "_id",null);
        groupFields.put("revenue", new BasicDBObject( "$sum", "$Order_Value"));
        DBObject group = new BasicDBObject("$group", groupFields);

          coll=db.getCollection("item_revenue");

        // run aggregation
        List<DBObject> pipeline = Arrays.asList(group);
        long total=0l;
        AggregationOutput output= coll.aggregate(pipeline);
        
        for (DBObject result : output.results()) {
            //System.out.println(result.get("_id"));
            total=Long.valueOf(result.get("revenue").toString());
        }
        return total;
    }
}
