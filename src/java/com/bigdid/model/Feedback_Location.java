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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author cignex
 */
public class Feedback_Location{
 
     private long sum;
    private int numCity=0;
    ArrayList<String> l;
   
    private static MongoClient dbClient = DBFactory.getDbClient();
	private static DB db = dbClient.getDB( "firstdb" );
    private static DBCollection coll;   
            
        
    public Feedback_Location() throws UnknownHostException{
       
       coll=db.getCollection("location_feedback_count");

    }
   
   public List getCity() throws SQLException, UnknownHostException {
      
       
	   List a =new ArrayList<String>();
            
        
         // Now the $group operation
        DBObject groupFields = new BasicDBObject( "_id", "$Location");
        groupFields.put("revenue", new BasicDBObject( "$sum", "$Order_Value"));
        DBObject group = new BasicDBObject("$group", groupFields);

        // Finally the $sort operation
        DBObject sort = new BasicDBObject("$sort", new BasicDBObject("revenue", -1));
        
        DBObject limit = new BasicDBObject("$limit", 10);

        // run aggregation
        List<DBObject> pipeline = Arrays.asList(group, sort,limit);
        
        AggregationOutput output= coll.aggregate(pipeline);
        
         for (DBObject result : output.results()) {
            //System.out.println(result.get("_id"));
            a.add(result.get("_id"));
        }
     
        //numCity= l.size();
        return a;

    }
    public int getNum() throws SQLException, UnknownHostException{
        getCity();
        return numCity;
    }
    
    public int getRevenue(Object city) throws SQLException, UnknownHostException {
        int revenue = 0;
     

        DBCursor obj= coll.find();
        
        while (obj.hasNext()) { 
             if (obj.next().get("Location").equals(city)) {
              
                revenue = (Integer) obj.next().get("Order_Value");
                
             }
         }
       
        return revenue;
    }
    
    public ArrayList<Integer> getGrade(Object Location) throws SQLException, UnknownHostException {
       // long[] grade = new long[4];
         ArrayList<Integer> grade = new ArrayList<Integer>();
        String city= (String) Location;
        
        BasicDBObject condition0 = new BasicDBObject("Location", city).append("Feedback", "Bad");
        DBCursor obj0 = coll.find(condition0);
       
        while (obj0.hasNext()) {
         //   grade[0] = (Integer) obj0.next().get("count");
            grade.add(0, (Integer) obj0.next().get("count"));
            
        }
        
        BasicDBObject condition1 = new BasicDBObject("Location", city).append("Feedback", "Good");
        DBCursor obj1 = coll.find(condition1);

        while (obj1.hasNext()) {
            //grade[1] = (Integer) obj1.next().get("count");
             grade.add(1, (Integer) obj1.next().get("count"));
        }
        
        

        BasicDBObject condition2 = new BasicDBObject("Location", city).append("Feedback", "Average");
        DBCursor obj2 = coll.find(condition2);

        while (obj2.hasNext()) {
            //grade[2] = (Integer) obj2.next().get("count");
             grade.add(2, (Integer) obj2.next().get("count"));
            
        }

        
        
        
         BasicDBObject condition3 = new BasicDBObject("Location", city).append("Feedback", "Excellent");
        DBCursor obj3 = coll.find(condition3);

        while (obj3.hasNext()) {
           // grade[3] = (Integer) obj3.next().get("count");
             grade.add(3, (Integer) obj3.next().get("count"));
        }      
        sum = (long) (grade.get(0) + grade.get(1) + grade.get(2) + grade.get(3));
        return grade;
    
    }
     public long getSum(Object city) throws SQLException, UnknownHostException {
        getGrade(city);
        return sum;
    } 
}
