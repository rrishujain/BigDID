/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Competitor_Prices;
import com.bigdid.model.Customer_Feedback_Amazon;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class Competitor_Prices_Servlet extends HttpServlet {

   
    ServletContext sc;
     Competitor_Prices CP;
    ArrayList<String> l;
    
    public void init(ServletConfig scfig) throws ServletException
    {

        try {
            CP= new Competitor_Prices();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Competitor_Prices_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        l = new ArrayList<String>();
        l = (ArrayList<String>) CP.getItems();
 
        sc=scfig.getServletContext();
        sc.setAttribute("Item",l );
        
        Map<String, List<Integer>> data = new HashMap<String, List<Integer>>();
        
        for(int i=0;i<l.size();i++){
            ArrayList<Integer> breakup = new ArrayList<Integer>();
            try {
                breakup=CP.getBreakup(l.get(i));
            } catch (UnknownHostException ex) {
                Logger.getLogger(Competitor_Prices_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            data.put(l.get(i), breakup);
            
        }
        sc.setAttribute("Price",data );
      
    }
    
}
