
package com.bigdid.controller;

import com.bigdid.model.Promotional_Offers;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author tanmay
 */
public class Promotional_Offers_Controller {

    Promotional_Offers PO;
    private ArrayList<Long> offers = new ArrayList<Long>();
    private ArrayList<String> date = new ArrayList<String>();
    
    Date[] dates;
    HashMap count ;

    public Promotional_Offers_Controller() throws UnknownHostException, ParseException {
        this.PO = new Promotional_Offers();
       count = PO.getSentimentCount();
    }

    public ArrayList<Long> getOffers() throws ParseException {
        offers = PO.getOffers();
        return offers;
    }

    public HashMap getPositiveCount() throws ParseException {
              
        return count;
    }
    public ArrayList<String> getDates() throws ParseException{
        date=PO.getDates();
        return date;
    }
    }


