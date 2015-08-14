/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

import com.bigdid.bean.Factory;
import com.bigdid.controller.Customer_Sentiment_Week_Controller;
import com.bigdid.controller.Customer_Sentiment_Date_Controller;
import com.bigdid.controller.Customer_Sentiment_Month_Controller;
import com.bigdid.controller.Customer_Sentiment_Date_Revised_Controller;
import com.bigdid.controller.Customer_Sentiment_Week_Revised_Controller;
import com.bigdid.controller.Feedback_Order_Days_Controller;
import com.bigdid.controller.Feedback_Order_Months_Controller;
import com.bigdid.controller.Feedback_Order_Weeks_Controller;
import com.bigdid.controller.Promotional_Offers_Controller;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author tanmay
 */
public class tester {

    public static void main(String args[]) throws SQLException, ParseException, UnknownHostException {
 Sentiment_Date_Revised_one sdro=new Sentiment_Date_Revised_one();
 Map<String, int[]> h1=new HashMap<String, int[]>();
 h1=sdro.getSentiment();
   Set set1 = h1.entrySet();
        // Get an iterator
       Iterator i1 = set1.iterator();
       
        // Display elements
        while (i1.hasNext()) {
          int[] array = new int[3];
          
            Map.Entry me = (Map.Entry) i1.next();
            System.out.print(me.getKey() + ": ");
            array = (int[]) me.getValue();
            
            System.out.println(array[0]);
           System.out.println(array[1]);
            System.out.println(array[2]);
//            System.out.println(array[3]);
//            System.out.println(array[4]);
//            System.out.println(array[5]);
//            System.out.println(array[6]);
//           

        }

    }
}
