//
//  Logger.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Alamofire

open class Logger{
    //MARK: lifecycle
    static public func logViewDidLoad(_ object:Any){
        let name = String(describing: type(of: object))
        logUrl("vc load   :\(name)")
    }
    static public func logDeinit(_ object:Any){
        let name = String(describing: type(of: object))
        logUrl("deinit    :\(name)")
    }
    
    //MARK: networking
    static public func logRequest(url:String,parameters: [String: Any]?, headers: HTTPHeaders?, method: HTTPMethod = .get){
        var logText =   "\n➡️➡️➡️➡️➡️➡️ REQUEST ➡️➡️➡️➡️➡️➡️➡️"
        logText +=      "\n" + "URL          - %@ "
        logText +=      "\n" + "parameters   - \(String(describing: parameters)) "
        logText +=      "\n" + "headers      - \(String(describing: headers)) "
        logText +=      "\n" + "method       - \(method) "
        logText +=      "\n➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️➡️"
        logUrl(logText,url:url)
    }
    
    static public func logResponse<Value>(packedResponse:DataResponse<Value>){
        var logText =   "\n⬅️⬅️⬅️⬅️⬅️⬅️ RESPONSE  ⬅️⬅️⬅️⬅️⬅️⬅️"
        logText +=      "\n" + "URL          - \(packedResponse.request?.url?.absoluteString ?? "nil")"
        if let statusCode = packedResponse.response?.statusCode{
            logText +=      "\n" + "code         - \(statusCode)"
        }
        if let error = packedResponse.result.error?.localizedDescription{
            logText +=      "\n" + "error        - \(error)"
        }
        logText +=      "\n⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️⬅️"
        logUrl(logText)
    }
    
    //MARK: other
    static public func log(_ text:String,_ logLevel:LogLevel = .none){
        logUrl("\(logLevel.rawValue) \(text)")
    }
    
    //MARK: private
    public static func logUrl(_ logText:String,url:String? = nil){
        NSLog(logText, url ?? "")
        //        CLSLogv(logText, getVaList([(url ?? "nil")]))
    }
    
    public enum LogLevel:String{
        case
        none    = "",
        info    = "✅",
        warn    = "⚠️",
        err     = "🔴"
    }
}
