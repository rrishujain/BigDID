/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Customer_Return_Percentage;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.util.ArrayList;
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
public class Customer_Return_Servlet extends HttpServlet {

      ServletContext sc;
         Customer_Return_Percentage CRP;


    public void init(ServletConfig scfig) throws ServletException
    {
          try {
              CRP = new Customer_Return_Percentage();
          } catch (UnknownHostException ex) {
              Logger.getLogger(Customer_Return_Servlet.class.getName()).log(Level.SEVERE, null, ex);
          }
        
          
          ///// feedbacks
        ArrayList<String> feed =new ArrayList<String>();
          try {
              feed=CRP.getFeedback();
          } catch (UnknownHostException ex) {
              Logger.getLogger(Customer_Return_Servlet.class.getName()).log(Level.SEVERE, null, ex);
          }
       
        sc=scfig.getServletContext();
        sc.setAttribute("Return_Feed",feed );
        
       //////Items
        
        ArrayList<String> item = null;
          try {
              item=CRP.getItem();
          } catch (UnknownHostException ex) {
              Logger.getLogger(Customer_Return_Servlet.class.getName()).log(Level.SEVERE, null, ex);
          }
        
          sc=scfig.getServletContext();
        sc.setAttribute("Return_Item",item );
        
        
        
    }
}
