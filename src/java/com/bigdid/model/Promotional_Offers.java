
package com.bigdid.model;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author tanmay
 */
public class Promotional_Offers {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;

    private ArrayList<Long> offer;
    ArrayList<String> offerName;
    HashMap<String, Integer> sentimentCount;
//    private Date[] current = new Date[4];
//    private Date[] date = new Date[4];
//    private int count;
//    private int[] offerperiod;

    public Promotional_Offers() throws UnknownHostException {
        coll = db.getCollection("offer_customer_count");

    }

    public ArrayList<Long> getOffers() throws ParseException {

        return offer;
    }
//        offer = new ArrayList<Long>();
//        int i = 0;
//        DBCursor obj = coll.find();
//        while (obj.hasNext()) {
//
//            DBObject dbObj = obj.next();
//            Integer num=new Integer((Integer)dbObj.get("orders_received"));
//            
//            offer.add(num.longValue());
//            i++;
//        }
//        return offer;
//    }

    public HashMap getSentimentCount() throws ParseException {
        sentimentCount = new HashMap<String, Integer>();
        offer = new ArrayList<Long>();
        offerName = new ArrayList<String>();

        DBCursor obj = coll.find();
        int i = 0;

        while (obj.hasNext()) {
            DBObject dbObj = obj.next();
            Integer num = new Integer((Integer) dbObj.get("order_count"));
            offer.add(num.longValue());
            String s=dbObj.get("offer")+"("+dbObj.get("days_lasted")+")";
            offerName.add(s);

            sentimentCount.put(offerName.get(i), (Integer) dbObj.get("count"));
            

            i++;
        }

        return sentimentCount;

    }

    public ArrayList<String> getDates() throws ParseException {

        return offerName;
    }
}
//        dateformat= new ArrayList<String>();
//
//        DBCursor obj = coll.find();
//        
//
//        while (obj.hasNext()) {
//            DBObject dbObj = obj.next();
//            dateformat.add((String) dbObj.get("offer_start_date").toString().substring(4, 10) + " " + (String) dbObj.get("offer_start_date").toString().substring(24));
//        }     
//
//        return dateformat;
//        
//    }
//}
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        String S = sdf.format(date);
//        
//        Calendar c = Calendar.getInstance();
//        c.setTime(sdf.parse(S));
//        for (int i = 0; i < offerperiod; i++) {
//            
//            c.add(Calendar.DATE, 1); 
//            S = sdf.format(c.getTime());
//            
//        }

    //    public Date[] getDates() {
//        int i = 0;
//        DBCursor obj = coll.find();
//        while (obj.hasNext()) {
//
//            DBObject dbObj = obj.next();
//            date[i] = (Date) dbObj.get("offer_start_date");
//
//            i++;
//
//        }
//        return date;
//
//    }
//
//    public int[] getOfferPeriod() {
//        DBCursor obj = coll.find();
//        offerperiod = new int[4];
//        int i = 0;
//        while (obj.hasNext()) {
//
//            DBObject dbObj = obj.next();
//
//            offerperiod[i] = (Integer) dbObj.get("days_lasted");
//
//            i++;
//
//        }
//        return offerperiod;
//
//    }

