//incomplete
package com.bigdid.controller;


import com.bigdid.model.Average_Value;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;

public class Average_Value_Controller {
    
    Average_Value AV;
    
    
    public long[] Breakup() throws UnknownHostException{
        AV =new Average_Value();
    long feed_av[]= new long[4];
    
    feed_av=AV.getBreakup();
    return feed_av;
    
    }
}
