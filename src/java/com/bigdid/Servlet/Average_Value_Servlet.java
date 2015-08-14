/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Average_Value;
import com.bigdid.model.Competitor_Prices;
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
public class Average_Value_Servlet extends HttpServlet {

    
    ServletContext sc;
     Average_Value AV;
    
    public void init(ServletConfig scfig) throws ServletException
    {
        try {
            AV =new Average_Value();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Average_Value_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    long feed_av[]= new long[4];
    
        try {
            feed_av=AV.getBreakup();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Average_Value_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        sc=scfig.getServletContext();
        sc.setAttribute("Breakup",feed_av );
    }
    
}
