/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Customer_Feedback_Ebay;
import com.bigdid.model.Customer_Feedback_Walmart;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
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
 * @author cignex
 */
public class Customer_Feedback_Walmart_Servlet extends HttpServlet {

    ServletContext sc;
public void init(ServletConfig scfig) throws ServletException
    {

        long[] c= new long[4];
        Customer_Feedback_Walmart CSW= null;
        try {
            CSW = new Customer_Feedback_Walmart();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Customer_Feedback_Walmart_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        c=CSW.getSentiments();
        
        sc=scfig.getServletContext();
        sc.setAttribute("Sentiment_Walmart",c );
        
    }
}
