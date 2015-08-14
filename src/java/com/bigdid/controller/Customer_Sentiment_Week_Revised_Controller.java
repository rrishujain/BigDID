/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.scrap.model.Customer_Sentiment_Date_Revised;
import com.bigdid.scrap.model.Customer_Sentiment_Week_Revised;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author tanmay
 */
public class Customer_Sentiment_Week_Revised_Controller {

    Customer_Sentiment_Week_Revised CSW;
     private ArrayList<Long> orderValue=new ArrayList<Long>();
    private ArrayList<Long> posCount=new ArrayList<Long>();
    private ArrayList<Long> negCount=new ArrayList<Long>();
    private ArrayList<String> week=new ArrayList<String>();

    public Customer_Sentiment_Week_Revised_Controller() throws UnknownHostException {
        this.CSW = new Customer_Sentiment_Week_Revised();
        CSW.getSentiment();
    }
    public ArrayList<Long> getPositiveCount(){
        posCount=CSW.getPositiveCount();
        return posCount;
    }
    public ArrayList<Long> getNegativeCount(){
        negCount=CSW.getNegativeCount();
        return negCount;
    }
    public ArrayList<String>getWeeks(){
        week=CSW.getWeeks();
        return week;
    }
    public ArrayList<Long> getOrderValues(){
        orderValue=CSW.getOrderValues();
        return orderValue;
    }
}