/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.scrap.model;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;

/**
 *
 * @author cignex
 */
public class ConnectionDB {
    public DB db;
    
    public ConnectionDB() throws UnknownHostException{
        MongoClient m = new MongoClient( "172.16.61.21" , 27017 );
          db = m.getDB( "firstdb" );
    }
    
}
