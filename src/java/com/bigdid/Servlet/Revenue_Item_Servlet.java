/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Promotional_Offers;
import com.bigdid.model.Revenue_Item;
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
public class Revenue_Item_Servlet extends HttpServlet {

    
     ServletContext sc;
    Revenue_Item RI;
    
     
    public void init(ServletConfig scfig) throws ServletException
    {
        
         try {
             RI = new Revenue_Item();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Revenue_Item_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
                
        ///// Revenue
        ArrayList<Integer> rev=new ArrayList<Integer>();
         try {
             rev = RI.getRevenue();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Revenue_Item_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
       
        sc=scfig.getServletContext();
        sc.setAttribute("Revenue_Item",rev);
        
        ///// Item
        
        ArrayList<String> item=new ArrayList<String>();
         try {
             item = RI.getItem();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Revenue_Item_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
          sc.setAttribute("Item",item);
    }
}
