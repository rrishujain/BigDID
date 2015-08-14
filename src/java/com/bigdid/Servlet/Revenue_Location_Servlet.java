/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Revenue_Location;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.util.HashMap;
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
public class Revenue_Location_Servlet extends HttpServlet {

        ServletContext sc;
    Revenue_Location RL;
    public void init(ServletConfig scfig) throws ServletException
    {
            try {
                RL= new Revenue_Location();
            } catch (UnknownHostException ex) {
                Logger.getLogger(Revenue_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        HashMap<String,Integer> location=new HashMap<String,Integer>();
            try {
                location = (HashMap<String, Integer>) RL.getLocationRevenue();
            } catch (UnknownHostException ex) {
                Logger.getLogger(Revenue_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        sc=scfig.getServletContext();
        sc.setAttribute("Revenue_Location",location);
        
    }
}
