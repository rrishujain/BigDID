/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Sentiment_Date_Revised_one;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
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
public class Sentiment_Date_Servlet extends HttpServlet {
     ServletContext sc;
     Sentiment_Date_Revised_one sdro;

    public void init(ServletConfig scfig) throws ServletException {
         try {
             sdro=new Sentiment_Date_Revised_one();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Sentiment_Date_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
         LinkedHashMap<String, int[]> data_sdro = new LinkedHashMap<String, int[]>();
         data_sdro=sdro.getSentiment();
         sc=scfig.getServletContext();
        sc.setAttribute("Sentiment_Date",data_sdro );
    }
}
