/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Feedback_Order_Days;
import com.bigdid.model.Sentiment_Date_Revised_one;
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
public class Feedback_Order_Days_Controller {
    Feedback_Order_Days FOD;
    Sentiment_Date_Revised_one sdro;
    

    public Feedback_Order_Days_Controller() throws UnknownHostException {
        this.FOD = new Feedback_Order_Days();
        this.sdro=new Sentiment_Date_Revised_one() ;
    }
    
    public HashMap getFeedback(){
          
        LinkedHashMap<String, int[]> data = new LinkedHashMap<String, int[]>();
        LinkedHashMap<String, int[]> data1 = new LinkedHashMap<String, int[]>();
        
        
        int [] finalArray=new int[7];
       LinkedHashMap<String, int[]> finalDataSet = new LinkedHashMap<String, int[]>();
        
        
        data = FOD.getFeedback();
        data1=sdro.getSentiment();
        
        
        Set set = data.entrySet();
        // Get an iterator
       Iterator i = set.iterator();
       
        // Display elements
        while (i.hasNext()) {
           int[] array = new int[4];
           int[] array1 = new int[3];
            Map.Entry me = (Map.Entry) i.next();

            array = (int[]) me.getValue();

          array1=(int[])data1.get(me.getKey() );
          try{
          finalArray[0]=array[0];
          finalArray[1]=array[1];
          finalArray[2]=array[2];
          finalArray[3]=array[3];
          finalArray[4]=array1[0];
          finalArray[5]=array1[1];
          finalArray[6]=array1[2];
          finalDataSet.put(me.getKey().toString() , finalArray);
          finalArray=new int[7];
          }
          catch(Exception e){
              System.out.println("Null Pointer");
          }
              
          
        }
        
          
        
        return finalDataSet;
    }
}
