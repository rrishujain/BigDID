//incomplete
package com.bigdid.controller;

import com.bigdid.model.Competitor_Prices;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author cignex
 */
public class Competitor_Prices_Controller {
    Competitor_Prices CP;
    ArrayList<String> l;
    public Competitor_Prices_Controller() throws UnknownHostException {
        this.CP = new Competitor_Prices();      
   }
    public ArrayList<String> Item() throws SQLException, UnknownHostException {
        l = new ArrayList<String>();
        l = (ArrayList<String>) CP.getItems();
        return l;

    }
    public Map<String, List<Integer>> Price() throws SQLException, UnknownHostException {
        Item();
        Map<String, List<Integer>> data = new HashMap<String, List<Integer>>();
        
        for(int i=0;i<l.size();i++){
            ArrayList<Integer> breakup = new ArrayList<Integer>();
            breakup=CP.getBreakup(l.get(i));
            data.put(l.get(i), breakup);
            
         
        }
        
        return data;
    }
}