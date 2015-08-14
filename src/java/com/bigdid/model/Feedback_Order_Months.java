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
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author tanmay
 */
public class Feedback_Order_Months {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;
    LinkedHashMap<String, int[]> data = new LinkedHashMap<>();

    public Feedback_Order_Months() throws UnknownHostException {
        coll = db.getCollection("feedback_order_months");
    }

    public LinkedHashMap<String, int[]> getFeedback() {
        DBCursor obj = coll.find();
        String current_date = "0";
        String prev_date = "0";
        int counter = 0;
        int[] count = new int[4];;
        while (obj.hasNext()) {

            DBObject dbObj = obj.next();
//            prev_date = current_date;
//            Date d = (Date) dbObj.get("Order_Date");

            current_date = (String) dbObj.get("month");
//
//            int prev_excellent = 0;
//            int prev_good = 0;
//            int prev_average = 0;
//            int prev_bad=0;

            if (dbObj.get("Feedback").equals("Excellent")) {
                count[0] = (Integer) dbObj.get("f_count");
                
                data.put(current_date, count);
                counter++;
            }
            if (dbObj.get("Feedback").equals("Good")) {
                count[1] = (Integer) dbObj.get("f_count");

                data.put(current_date, count);
                counter++;
            }
            if (dbObj.get("Feedback").equals("Average")) {
                count[2] = (Integer) dbObj.get("f_count");

                data.put(current_date, count);
                counter++;
            }
            if (dbObj.get("Feedback").equals("Bad")) {
                count[3] = (Integer) dbObj.get("f_count");

                data.put(current_date, count);
                counter++;
            }
           
if(counter%4==0){
//    System.out.println(current_date);
//    System.out.println(count[0]);
//    System.out.println(count[1]);
//    System.out.println(count[2]);
//    System.out.println(count[3]);
    data.put(current_date, count);
    
   count=new int[4];
}
           
        }
 
 return data;
    }
}
