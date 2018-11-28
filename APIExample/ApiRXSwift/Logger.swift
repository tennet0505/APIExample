//
//  Logger.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Alamofire

class Logger{
    //MARK: lifecycle
    static func logViewDidLoad(_ object:Any){
        let name = String(describing: type(of: object))
        logUrl("vc load   :\(name)")
    }
    static func logDeinit(_ object:Any){
        let name = String(describing: type(of: object))
        logUrl("deinit    :\(name)")
    }
    
    //MARK: networking
    static func logRequest(url:String,parameters: [String: Any]?, headers: HTTPHeaders?, method: HTTPMethod = .get){
        var logText =   "\n------------- REQUEST ---------------"
        logText +=      "\n" + "URL          - %@ "
        logText +=      "\n" + "parameters   - \(String(describing: parameters)) "
        logText +=      "\n" + "headers      - \(String(describing: headers)) "
        logText +=      "\n" + "method       - \(method) "
        logText +=      "\n-------------------------------------"
        logUrl(logText,url:url)
    }
    //MARK: other
    static func log(_ text:String,_ logLevel:LogLevel = .none){
        logUrl("\(logLevel.rawValue) \(text)")
    }
    
    //MARK: private
    private static func logUrl(_ logText:String,url:String? = nil){
        NSLog(logText, url ?? "nil")
        //        CLSLogv(logText, getVaList([(url ?? "nil")]))
    }
    
    enum LogLevel:String{
        case
        none    = "",
        info    = "✅",
        warn    = "⚠️",
        err     = "🔴"
    }
}

