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
import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 *
 * @author tanmay
 */
public class Sentiment_Week_Revised_one {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;
    LinkedHashMap<String, int[]> data = new LinkedHashMap<>();
    HashMap<String, int[]> data1 = new HashMap<>();

    public Sentiment_Week_Revised_one() throws UnknownHostException {
        coll = db.getCollection("sentiment_order_weeks");
    }

    public LinkedHashMap<String, int[]> getSentiment() {
        DBCursor obj = coll.find();
        String current_date = "0";
        String prev_date = "0";
        int prev_positive = 0;
        while (obj.hasNext()) {
            DBObject dbObj = obj.next();
            prev_date = current_date;
            current_date = (String) dbObj.get("week");
            int[] count = new int[3];

            if (prev_date.equals(current_date)) { //current day is previous day so negative sentiment for sure
                count[0] = (Integer) dbObj.get("o_count");
                count[1] = prev_positive;
                count[2] = (Integer) dbObj.get("s_count");

                data.put(current_date, count);

            } else {       //new day---- 2 cases positive or negative
                if (dbObj.get("sentiment").equals("positive")) {
                    count[0] = (Integer) dbObj.get("o_count");
                    count[1] = (Integer) dbObj.get("s_count");;
                    count[2] = 0;

                    data.put(current_date, count);
                    prev_positive = count[1];

                }

                if (dbObj.get("sentiment").equals("negative")) {  //first date is negative
                    count[0] = (Integer) dbObj.get("o_count");
                    count[1] = 0;
                    count[2] = (Integer) dbObj.get("s_count");

                    data.put(current_date, count);

                }
            }
        }

        return data;

    }
}
