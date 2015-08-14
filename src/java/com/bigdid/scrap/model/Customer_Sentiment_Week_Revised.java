package com.bigdid.scrap.model;

import com.bigdid.model.DBFactory;
import com.bigdid.model.DBFactory;
import com.mongodb.*;
import java.net.UnknownHostException;
import java.util.*;

/**
 *
 * @author tanmay
 */
public class Customer_Sentiment_Week_Revised {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;

    private ArrayList<Long> orderValue;
    private ArrayList<Long> posCount;
    private ArrayList<Long> negCount;
    private ArrayList<String> week;

    public Customer_Sentiment_Week_Revised() throws UnknownHostException {
        coll = db.getCollection("sentiment_order_weeks");
    }

    public void getSentiment() {

        posCount = new ArrayList<Long>();
        negCount = new ArrayList<Long>();
        week = new ArrayList<String>();
        orderValue = new ArrayList<Long>();
        int i = 0;

        DBCursor obj = coll.find();
        while (obj.hasNext()) {
            DBObject dbObj = obj.next();
            if (i % 2 == 0) {

                String s = (String) dbObj.get("week");
                week.add(s);
            

                Integer num = new Integer((Integer) dbObj.get("o_count"));
                orderValue.add(num.longValue());
            

            }
            i++;
            

            if (dbObj.get("sentiment").equals("positive")) {
                Integer num = new Integer((Integer) dbObj.get("s_count"));
                posCount.add(num.longValue());
                

            } else if (dbObj.get("sentiment").equals("negative")) {
                Integer num = new Integer((Integer) dbObj.get("s_count"));
                negCount.add(num.longValue());
                

            }
            

        }

    }
     public ArrayList<Long> getPositiveCount() {
        return posCount;
    }

    public ArrayList<Long> getNegativeCount() {
        return negCount;
    }

    public ArrayList<String> getWeeks() {
        return week;
    }

    public ArrayList<Long> getOrderValues() {
        return orderValue;
    }

}
