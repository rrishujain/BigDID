/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Customer_Feedback_Amazon;
import java.net.UnknownHostException;

/**
 *
 * @author cignex
 */
public class Customer_Feedback_Amazon_Controller {
    
    public long[] sentiments() throws UnknownHostException{
        long[] c= new long[4];
        Customer_Feedback_Amazon CSA =new Customer_Feedback_Amazon();
        
        c=CSA.getSentiments();
        return c;
    }
    
}
