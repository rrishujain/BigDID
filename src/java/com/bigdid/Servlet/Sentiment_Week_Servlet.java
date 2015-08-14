/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Sentiment_Date_Revised_one;
import com.bigdid.model.Sentiment_Week_Revised_one;
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
public class Sentiment_Week_Servlet extends HttpServlet {
     ServletContext sc;
     Sentiment_Week_Revised_one swro;

    public void init(ServletConfig scfig) throws ServletException {
         try {
             swro=new Sentiment_Week_Revised_one();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Sentiment_Date_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
         LinkedHashMap<String, int[]> data_swro = new LinkedHashMap<String, int[]>();
         data_swro=swro.getSentiment();
         sc=scfig.getServletContext();
        sc.setAttribute("Sentiment_Week",data_swro );
    }
}
