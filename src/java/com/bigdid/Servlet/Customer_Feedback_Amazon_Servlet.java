/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bigdid.model.*;
import javax.servlet.ServletContext;

/**
 *
 * @author cignex
 */
public class Customer_Feedback_Amazon_Servlet extends HttpServlet {

    ServletContext sc;
    
    public void init(ServletConfig scfig) throws ServletException
    {

        long[] c= new long[4];
        Customer_Feedback_Amazon CSA = null;
        try {
            CSA = new Customer_Feedback_Amazon();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Customer_Feedback_Amazon_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        c=CSA.getSentiments();
        
         sc=scfig.getServletContext();
        sc.setAttribute("Sentiment_Amazon",c );
        
    }
}

