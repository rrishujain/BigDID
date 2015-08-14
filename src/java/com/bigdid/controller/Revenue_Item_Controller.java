//Not used


package com.bigdid.controller;

import com.bigdid.model.Revenue_Item;
import com.bigdid.model.Revenue_Location;
import com.mongodb.DB;
import java.net.UnknownHostException;
import java.util.ArrayList;

/**
 *
 * @author cignex
 */
public class Revenue_Item_Controller {

    Revenue_Item RI;

    public Revenue_Item_Controller() throws UnknownHostException {
        this.RI = new Revenue_Item();
    }

    public ArrayList<Integer> revenue() throws UnknownHostException {
        ArrayList<Integer> rev=new ArrayList<Integer>();
        rev = RI.getRevenue();
        return rev;
    }

    public ArrayList<String> item() throws UnknownHostException {
        ArrayList<String> item=new ArrayList<String>();
        item = RI.getItem();
        return item;
    }

}
