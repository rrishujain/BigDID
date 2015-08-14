/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.scrap.model;

import com.mongodb.DBCollection;
import java.net.UnknownHostException;

/**
 *
 * @author cignex
 */
public class Customer_Sentiment_DoubleLineChart extends ConnectionDB{
    
        DBCollection coll;
        
        public Customer_Sentiment_DoubleLineChart() throws UnknownHostException {
            coll=db.getCollection("Customer_Sentiments");
        }
        
        public void getCount(String date){
            
            
        }
}
