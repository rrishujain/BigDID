/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bigdid.model;

import java.net.UnknownHostException;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;

/**
 *
 * @author cignex
 */
public final class DBFactory {
   
    private static MongoClient dbClient = null;
    
    private DBFactory() {
	}
    public static MongoClient getDbClient() {
		if (dbClient == null) {
			try {
				dbClient = getMongoClient();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dbClient;
	}
    
    
    private static MongoClient getMongoClient() throws UnknownHostException
    {
    	MongoClient mongo;
    	mongo = new MongoClient( "172.16.61.21" , 27017);
        
          return mongo;
    }
    
}
