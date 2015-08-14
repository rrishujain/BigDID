/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Revenue_Location;
import com.mongodb.DB;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author cignex
 */
public class Revenue_Location_Controller {

    Revenue_Location RL;

    public Revenue_Location_Controller() throws UnknownHostException {
        this.RL = new Revenue_Location();
    }

    public HashMap<String,Integer> getLocationRevenue() throws UnknownHostException {
    	HashMap<String,Integer> location=new HashMap<String,Integer>();
        location = (HashMap<String, Integer>) RL.getLocationRevenue();
        return location;
    }

  

}
