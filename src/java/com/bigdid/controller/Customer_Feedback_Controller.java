//incomplete
package com.bigdid.controller;

import com.bigdid.model.Customer_Feedback;
import java.net.UnknownHostException;

/**
 *
 * @author cignex
 */
public class Customer_Feedback_Controller {
    Customer_Feedback CF;

    public Customer_Feedback_Controller() throws UnknownHostException {
        this.CF = new Customer_Feedback();
    }
    
    public int[] Count() throws UnknownHostException{
        int count[]=new int[4];
        count=CF.getCount();
        return count;
    }
    }
    

