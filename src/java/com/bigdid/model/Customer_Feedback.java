/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

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
public class Customer_Feedback{
    
 
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    public Customer_Feedback() throws UnknownHostException{
       
        coll=db.getCollection("customer_feedback_count");
        
    }
    
    public int[] getCount() throws UnknownHostException{
         // Now connect to your databases
         String item[] = new String[100];
        int i=0;
         int count[]=new int[4];
        DBCursor obj= coll.find();
        while (obj.hasNext()) {

             DBObject dbObj=obj.next();
             count[i]= (Integer) dbObj.get("Count");
             i++;
        }
        return count;
    }
}
