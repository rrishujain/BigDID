/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Feedback_Order_Days;
import com.bigdid.model.Feedback_Order_Months;
import com.bigdid.model.Feedback_Order_Weeks;
import com.bigdid.model.Sentiment_Date_Revised_one;
import com.bigdid.model.Sentiment_Month_Revised_one;
import com.bigdid.model.Sentiment_Week_Revised_one;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author tanmay
 */
public class Feedback_Order_Months_Controller {

    Feedback_Order_Months FOM;
    Sentiment_Month_Revised_one smro;

    public Feedback_Order_Months_Controller() throws UnknownHostException {
        this.FOM = new Feedback_Order_Months();
        this.smro = new Sentiment_Month_Revised_one();
    }

    public HashMap getFeedback() {

        LinkedHashMap<String, int[]> data_sentiment = new LinkedHashMap<String, int[]>();
        LinkedHashMap<String, int[]> data_feedback = new LinkedHashMap<String, int[]>();

        int[] finalArray = new int[7];
        LinkedHashMap<String, int[]> finalDataSet = new LinkedHashMap<String, int[]>();

        data_feedback = FOM.getFeedback();
        data_sentiment = smro.getSentiment();

        Set set = data_feedback.entrySet();
        // Get an iterator
        Iterator i = set.iterator();

        // Display elements
        while (i.hasNext()) {
            int[] array = new int[4];
            int[] array1 = new int[3];
            Map.Entry me = (Map.Entry) i.next();

            array = (int[]) me.getValue();

            array1 = (int[]) data_sentiment.get(me.getKey());
            try {
                finalArray[0] = array[0];
//                System.out.println(array[0]);
                finalArray[1] = array[1];
//                System.out.println(array[1]);
                finalArray[2] = array[2];
//                System.out.println(array[2]);
                finalArray[3] = array[3];
//                System.out.println(array[3]);
                finalArray[4] = array1[0];
//                System.out.println(array1[0]);
                finalArray[5] = array1[0];
//                System.out.println(array1[1]);
                finalArray[6] = array1[2];
                finalDataSet.put(me.getKey().toString(), finalArray);
            finalArray = new int[7];
//                System.out.println(array1[2]);
            } catch (Exception e) {
                System.out.println("Null Pointer");
//                return finalDataSet;

            }
            
        }

//          
//            Set set2 = finalDataSet.entrySet();
//        // Get an iterator
//       Iterator i2 = set2.iterator();
//       
//        // Display elements
//        while (i2.hasNext()) {
//           int[] array = new int[7];
//           
//            Map.Entry me = (Map.Entry) i2.next();
//            System.out.print(me.getKey() + ": ");
//            array = (int[]) me.getValue();
//            
//            System.out.println(array[0]);
//           System.out.println(array[1]);
//            System.out.println(array[2]);
//            System.out.println(array[3]);
//           System.out.println(array[4]);
//            System.out.println(array[5]);
//            System.out.println(array[6]);
//         
//         
//        }
//          
//        
        return finalDataSet;
    }
}
