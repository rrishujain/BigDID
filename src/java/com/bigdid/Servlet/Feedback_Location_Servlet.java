/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.Servlet;

import com.bigdid.model.Feedback_Location;
import com.bigdid.model.Promotional_Offers;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.sql.SQLException;
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
public class Feedback_Location_Servlet extends HttpServlet {

     ServletContext sc;
    
     Feedback_Location FL;
    ArrayList<String> l;

    public void init(ServletConfig scfig) throws ServletException
    {
         try {
             FL =new Feedback_Location();
         } catch (UnknownHostException ex) {
             Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
     l = new ArrayList<String>();
        
     //////////city
        try {
             l = (ArrayList<String>) FL.getCity();
         } catch (SQLException ex) {
             Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         } catch (UnknownHostException ex) {
             Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
         }
  
        sc=scfig.getServletContext();
        sc.setAttribute("Feedback_City",l );
        
        /////grade
        
          Map<String, List<Integer>> data = new HashMap<String,List<Integer>>();

        for (int i = 0; i < l.size(); i++) {
            //long[] grade = new long[4];
            ArrayList<Integer> grade = new ArrayList<Integer>();
            
            float[] net = new float[4];
             try {
                 //ArrayList<Float> grade1 = new ArrayList<Float>();
                 grade = FL.getGrade(l.get(i));
                 // net[0] = ((float) grade[0] / (float) FL.getSum(l.get(i)) * (float) FL.getRevenue(l.get(i)));
                 // net[1] = ((float) grade[1] / (float) FL.getSum(l.get(i)) * (float) FL.getRevenue(l.get(i)));
                 // net[2] = ((float) grade[2] / (float) FL.getSum(l.get(i)) * (float) FL.getRevenue(l.get(i)));
                 // net[3] = ((float) grade[3] / (float) FL.getSum(l.get(i)) * (float) FL.getRevenue(l.get(i)));
                 // grade1.add(net[0]);
                 // grade1.add(net[1]);
                 // grade1.add(net[2]);
                 // grade1.add(net[3]);
             } catch (SQLException ex) {
                 Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
             } catch (UnknownHostException ex) {
                 Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
             }

            data.put(l.get(i),grade);

        }
        sc.setAttribute("Feedback_Grade",data );
        /////revenue
        
        ArrayList<Integer > revenue = new ArrayList<Integer >();
        
        int size=l.size();
        int r = 0,i;   
        for(i=0;i<size; i++){    
        
             try {
                 r = FL.getRevenue(l.get(i));
             } catch (SQLException ex) {
                 Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
             } catch (UnknownHostException ex) {
                 Logger.getLogger(Feedback_Location_Servlet.class.getName()).log(Level.SEVERE, null, ex);
             }
            revenue.add(r);        
        
        }
        sc.setAttribute("Revenue",revenue );
    }
        
}
