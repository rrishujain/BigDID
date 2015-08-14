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
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import com.bigdid.model.DBFactory;

/**
 *
 * @author cignex
 */
public class Competitor_Prices {
 
	private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
    public Competitor_Prices() throws UnknownHostException{
              coll=db.getCollection("competitor_prices");
    }
    
    
    public ArrayList<Integer> getBreakup(String item) throws UnknownHostException{
        
         
         BasicDBObject whereQuery = new BasicDBObject();
         whereQuery.put( "Item", item );

         DBCursor obj= coll.find(whereQuery);
         ArrayList<Integer> price=new ArrayList<Integer>();
         
        
        while (obj.hasNext()) {
          
             price.add((Integer) obj.next().get("Price"));
             
        }
        
        return price;
    }
    public int getItemNumber(){
        int size =0;
      
         List l = coll.distinct("Item");
        
         size= l.size();
        return size;
    }
    public ArrayList<String>  getItems(){
        int i=0;
       ArrayList<String> item=new ArrayList<String>();
        List l = coll.distinct("Item");
        String s[] = new String[50];
        for(i=0;i<l.size();i++){
            item.add((String) l.get(i));
        }
        return item;
    }
}
