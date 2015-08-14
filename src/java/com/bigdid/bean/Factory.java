package com.bigdid.bean;

import com.bigdid.scrap.model.Customer_Sentiment_Date_Revised;
import com.bigdid.model.DBFactory;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author tanmay
 */
public class Factory {

    private static  ArrayList<Long> orderValue;
    private static  ArrayList<Long> posCount;
    private static ArrayList<Long> negCount;
    private static ArrayList<String> date;
    Customer_Sentiment_Date_Revised CSR;

    public Factory() throws UnknownHostException {
        this.CSR = new Customer_Sentiment_Date_Revised();
        CSR.getSentiment();
        this.orderValue = CSR.getOrderValues();
        this.posCount = CSR.getPositiveCount();
        this.negCount = CSR.getNegativeCount();

    }
    

    public static java.util.Collection generateCollection() {

        java.util.Vector date = new java.util.Vector();
        for (int i = 0; i < 4; i++) {
            date.add(new SentimentBean(orderValue.get(i), posCount.get(i), negCount.get(i)));
           
        }
        return date;
   }
    
    public void testMethod(){
        for (int i = 0; i < 4; i++) {
            
            System.out.println(orderValue.get(i));
            System.out.println(posCount.get(i));
            System.out.println(negCount.get(i));
        }
    }
}
