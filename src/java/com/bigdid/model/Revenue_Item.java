package com.bigdid.model;


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
public class Revenue_Item{
    
    
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    
    public Revenue_Item() throws UnknownHostException{
        
       coll=db.getCollection("item_revenue");
    }
            
    
    
    public ArrayList<String> getItem() throws UnknownHostException{
         ArrayList<String> item=new ArrayList<String>();
	 
        int i=0;
        DBCursor obj= coll.find();
        while (obj.hasNext()) {

            item.add((String) obj.next().get("Item"));
            i++;

        }
        
        return item;
    }
    public ArrayList<Integer> getRevenue() throws UnknownHostException{
      
       ArrayList<Integer> revenue=new ArrayList<Integer>();
        int i=0;
         DBCursor obj= coll.find();
        
        int size=obj.size();
        
            for(i=0;i<size;i++){
            revenue.add((Integer) obj.next().get("Order_Value"));
            }

        
        
        return revenue;
    }
}
