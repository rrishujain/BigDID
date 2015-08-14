/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.controller;

import com.bigdid.model.Feedback_Location;
import com.mongodb.DB;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author cignex
 */
public class Feedback_Location_Controller {

    Feedback_Location FL;
    ArrayList<String> l;

    public Feedback_Location_Controller() throws UnknownHostException {
        FL = new Feedback_Location();
    }

    public ArrayList<String> City() throws SQLException, UnknownHostException {
        l = new ArrayList<String>();
        l = (ArrayList<String>) FL.getCity();
        return l;

    }

    public Map<String,List<Integer>> grade() throws SQLException, UnknownHostException {
        City();
        Map<String, List<Integer>> data = new HashMap<String,List<Integer>>();

        for (int i = 0; i < l.size(); i++) {
            //long[] grade = new long[4];
            ArrayList<Integer> grade = new ArrayList<Integer>();
            
            float[] net = new float[4];
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

            data.put(l.get(i),grade);

        }

        return data;


    }
    
    public ArrayList<Integer> TotalRevenue() throws SQLException, UnknownHostException{
        
        ArrayList<Integer > revenue = new ArrayList<Integer >();
        
        int size=l.size();
        int r,i;   
        for(i=0;i<size; i++){    
        
            r = FL.getRevenue(l.get(i));
            revenue.add(r);        
        
        }
    return revenue;
    }
    
}
