/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.scrap.model;

import com.bigdid.model.DBFactory;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author tanmay
 */
public class Sentiment_Date {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;
    HashMap<String, int[]> data = new HashMap<>();

    public Sentiment_Date() throws UnknownHostException {
        coll = db.getCollection("sentiment_order_days");
    }

    public HashMap<String, int[]> getSentiment() {
        DBCursor obj = coll.find();
        int i = 0;

        String current_date = "0";
        String prev_date = "0";
        int[] count = new int[3];
        while (obj.hasNext()) {
            DBObject dbObj = obj.next();
            prev_date = current_date;
            current_date = (String) dbObj.get("date").toString().substring(4, 10) + " " + (String) dbObj.get("date").toString().substring(24);
            System.out.println("current date" +current_date);
            System.out.println("previous date :" +prev_date);
            int prev_positive = 0;
            int prev_orderValue = 0;
            String prev_sentiment = "0";

            if (prev_date.equals(current_date)) {                        //repeat date entry having negative count for sure 
                count[1] = prev_positive;
                count[2] = (Integer) dbObj.get("count");
                count[0] = (Integer) dbObj.get("order_count");
                data.put(current_date, count);
                prev_positive = 0;
                count[0] = 0;
                count[1] = 0;
                count[2] = 0;

            } else {                                                           //new date
                if (prev_sentiment.equals("positive") && dbObj.get("sentiment").equals("positive")) {
                    count[0] = prev_orderValue;
                    count[1] = prev_positive;
                    count[2] = 0;
                    data.put(prev_date, count);
                    count[0] = 0;
                    count[1] = 0;
                    count[2] = 0;
                    prev_sentiment="0";
                }

                if (dbObj.get("Sentiment").equals("positive")) {
                    prev_positive = (Integer) dbObj.get("count");
                    prev_orderValue = (Integer) dbObj.get("order_count");
                    prev_sentiment = "positive";

                } else {                                                        //new date with negative count
                    prev_positive = 0;
                    count[1] = prev_positive;
                    count[2] = (Integer) dbObj.get("count");
                    count[0] = (Integer) dbObj.get("order_count");
                    data.put(current_date, count);

                    count[0] = 0;
                    count[1] = 0;
                    count[2] = 0;
                }

            }

        }
        return data;
        
    }
}
