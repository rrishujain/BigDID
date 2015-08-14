/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Customer_Feedback_Amazon;
import com.bigdid.model.Customer_Feedback_Ebay;
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
public class Customer_Feedback_Ebay_Servlet extends HttpServlet {

     ServletContext sc;
    
      public void init(ServletConfig scfig) throws ServletException
    {

        long[] c= new long[4];
        Customer_Feedback_Ebay CSE= null;
        try {
            CSE = new Customer_Feedback_Ebay();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Customer_Feedback_Amazon_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        c=CSE.getSentiments();
        
        
         sc=scfig.getServletContext();
        sc.setAttribute("Sentiment_Ebay",c );
        
    }
    
}
