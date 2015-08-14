/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.bean;

/**
 *
 * @author tanmay
 */
public class SentimentBean {

    long OrderValue;
    long posCount;
    long negCount;

    public SentimentBean(long OrderValue, long posCount, long negCount) {
        this.OrderValue=OrderValue;
        this.posCount=posCount;
        this.negCount=negCount;
    }
    
    public long getPositiveCount(){
        return posCount;
    }
    public long getNegativeCount(){
        return negCount;
    }
    public long getOrderValue(){
        return OrderValue;
    }

}
