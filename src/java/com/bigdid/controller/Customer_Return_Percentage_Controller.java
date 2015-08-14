//incomplete
package com.bigdid.controller;

import com.bigdid.model.Customer_Return_Percentage;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author cignex
 */
public class Customer_Return_Percentage_Controller {
    Customer_Return_Percentage CRP;

    public Customer_Return_Percentage_Controller() throws UnknownHostException {
        this.CRP = new Customer_Return_Percentage();
    }
    
    public ArrayList<String> Feedback() throws UnknownHostException{
        ArrayList<String> feed;
        feed=CRP.getFeedback();
        return feed;
    }
    
    public ArrayList<String> Item() throws UnknownHostException{
        ArrayList<String> item;
        item=CRP.getItem();
        return item;
    }
}
