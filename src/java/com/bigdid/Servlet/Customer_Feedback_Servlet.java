/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Customer_Feedback;
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
public class Customer_Feedback_Servlet extends HttpServlet {

    Customer_Feedback CF;
    ServletContext sc;
public void init(ServletConfig scfig) throws ServletException
    {
        try {
            CF = new Customer_Feedback();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Customer_Feedback_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        int count[]=new int[4];
        try {
            count=CF.getCount();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Customer_Feedback_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        sc=scfig.getServletContext();
        sc.setAttribute("Feedback_Count",count );
    }
    
}
