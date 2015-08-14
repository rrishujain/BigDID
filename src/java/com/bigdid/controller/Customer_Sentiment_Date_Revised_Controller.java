/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.scrap.model.Customer_Sentiment_Date_Revised;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author tanmay
 */
public class Customer_Sentiment_Date_Revised_Controller {

    Customer_Sentiment_Date_Revised CSR;
     private ArrayList<Long> orderValue=new ArrayList<Long>();
    private ArrayList<Long> posCount=new ArrayList<Long>();
    private ArrayList<Long> negCount=new ArrayList<Long>();
    private ArrayList<String> date=new ArrayList<String>();

    public Customer_Sentiment_Date_Revised_Controller() throws UnknownHostException {
        this.CSR = new Customer_Sentiment_Date_Revised();
        CSR.getSentiment();
    }
    public ArrayList<Long> getPositiveCount(){
        posCount=CSR.getPositiveCount();
        return posCount;
    }
    public ArrayList<Long> getNegativeCount(){
        negCount=CSR.getNegativeCount();
        return negCount;
    }
    public ArrayList<String>getDates(){
        date=CSR.getDates();
        return date;
    }
    public ArrayList<Long> getOrderValues(){
        orderValue=CSR.getOrderValues();
        return orderValue;
    }
}