//
//  BaseService.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import RxAlamofire
import RxSwift

class BaseService {
    func createRequest<T:Mappable>(
        url:String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default) -> Observable<T>{
        Logger.logRequest(url: url, parameters: parameters, headers: headers, method: method)
        
        return Alamofire.SessionManager.default.request(
            url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "",
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers)
            .rx
            .mappable()
    }
    func createRequest<T:Mappable>(
        url:String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil,
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default) -> Observable<[T]>{
        Logger.logRequest(url: url, parameters: parameters, headers: headers, method: method)
        
        return Alamofire.SessionManager.default.request(
            url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "",
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers)
            .rx
            .mappableArray()
    }
}
