package com.bigdid.model;


import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cignex
 */
public class Customer_Return_Percentage{
    
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    public Customer_Return_Percentage() throws UnknownHostException{
   
        coll=db.getCollection("item_return_percentage");
}
    
    public ArrayList<String> getItem() throws UnknownHostException{
        
      
         ArrayList<String> item=new ArrayList<String>();
    
	
        int i=0;
        DBCursor obj= coll.find();
        while (obj.hasNext()) {

            item.add((String) obj.next().get("Item"));
            

        }
        
        return item;
    }
    public ArrayList<String> getFeedback() throws UnknownHostException{
   
        ArrayList<String> feedback=new ArrayList<String>();
         DBCursor obj= coll.find();
//         BasicDBObject whereQuery = new BasicDBObject();

//        whereQuery.put( "Percentage", -1 );
//        obj.sort(whereQuery);
        
        int size=obj.size();
        int i;
            for(i=0;i<size;i++){
            feedback.add(((String) obj.next().get("Percentage")));
            
            System.out.println("Valuesss"+feedback.get(i));
            }

        
        
        return feedback;
    }
}
