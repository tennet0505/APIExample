//
//  API.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Foundation
import RxSwift

class API: BaseService {

private var serverUrl:String {
    return Constants.API_URL
    //        return Constants.APIARY_URL
   
    }
    
    static var shared = API() // Singleton
    
    
    func getServices() -> Observable<[Service]>{
        return createRequest(url: serverUrl + "/DishOfDayList")
    }
    
    
}
