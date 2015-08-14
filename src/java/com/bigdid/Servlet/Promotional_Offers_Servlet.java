/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Promotional_Offers;
import com.bigdid.model.Sentiment_Date_Revised_one;
import com.bigdid.model.Sentiment_Month_Revised_one;
import com.bigdid.model.Sentiment_Week_Revised_one;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tanmay
 */
public class Promotional_Offers_Servlet extends HttpServlet {

    ServletContext sc;
    Promotional_Offers PO;
    ArrayList<Long> offers = new ArrayList<Long>();
    ArrayList<String> date = new ArrayList<String>();

    Date[] dates;
    HashMap count;

    public void init(ServletConfig scfig) throws ServletException {
        try {
            PO = new Promotional_Offers();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Promotional_Offers_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            PO = new Promotional_Offers();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Promotional_Offers_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            count = PO.getSentimentCount();

        } catch (ParseException ex) {
            Logger.getLogger(Promotional_Offers_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            date = PO.getDates();
        } catch (ParseException ex) {
            Logger.getLogger(Promotional_Offers_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {

            offers = PO.getOffers();
        } catch (ParseException ex) {
            Logger.getLogger(Promotional_Offers_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        sc = scfig.getServletContext();
        sc.setAttribute("Date", date);
        sc.setAttribute("Positive_Count", count);
        sc.setAttribute("Offers", offers);
    }
}
