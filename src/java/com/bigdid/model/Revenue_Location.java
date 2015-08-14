/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

import com.mongodb.*;
import java.net.UnknownHostException;
import java.util.*;

/**
 *
 * @author cignex
 */
public class Revenue_Location {

    private static MongoClient dbClient = DBFactory.getDbClient();
    private static DB db = dbClient.getDB("firstdb");
    private static DBCollection coll;

    public Revenue_Location() throws UnknownHostException {

        coll = db.getCollection("location_revenue");
    }

    public Map<String, Integer> getLocationRevenue() throws UnknownHostException {
        HashMap<String, Integer> locationRevenue = new HashMap<String, Integer>();

        int i = 0;
        BasicDBObject whereQuery = new BasicDBObject("Order_Value", -1);

        DBCursor obj = coll.find().sort(whereQuery).limit(10);

        while (obj.hasNext()) {
            DBObject dbObj = obj.next();
            
            locationRevenue.put((String) dbObj.get("Location"), (Integer) dbObj.get("Order_Value"));

        }
        Map<String, Integer> map = sortByValues(locationRevenue);

        
        return map;
    }

    private static HashMap sortByValues(HashMap map) {
        List list = new LinkedList(map.entrySet());

        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                return ((Comparable) ((Map.Entry) (o2)).getValue())
                        .compareTo(((Map.Entry) (o1)).getValue());
            }
        });

        HashMap sortedHashMap = new LinkedHashMap();
        for (Iterator it = list.iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            sortedHashMap.put(entry.getKey(), entry.getValue());
        }
        return sortedHashMap;
    }
}
