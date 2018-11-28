//
//  RxAlamofireExtation.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import ObjectMapper
import RxAlamofire

extension Reactive where Base: DataRequest {
    public func mappable<T:Mappable>() -> Observable<T>{
        return string()
            .flatMap{ response -> Observable<T> in
                let response = response.isBlank ? "{}" : response
                return Observable.create{ observer in
                    print(response)
                    if let result = Mapper<T>().map(JSONString: response){
                        print(result)
                        observer.onNext(result)
                    } else {
                        let
                        userInfo = [NSLocalizedFailureReasonErrorKey: "JSON_PARSE_ERROR".localized],
                        error = NSError(domain: "com.tmaamv", code: 1, userInfo: userInfo)
                        observer.onError(error)
                    }
                    return Disposables.create()
                }
        }
    }
    
    
    public func mappableArray<T:Mappable>() -> Observable<[T]>{
        return string()
            .flatMap{ response -> Observable<[T]> in
                let response = response.isBlank ? "{}" : response
                return Observable.create{ observer in
                    print(response)
                    if let result = Mapper<T>().mapArray(JSONString: response){
                        print(result)
                        observer.onNext(result)
                    } else {
                        let
                        userInfo = [NSLocalizedFailureReasonErrorKey: "JSON_PARSE_ERROR".localized],
                        error = NSError(domain: "com.com.tmaamv", code: 1, userInfo: userInfo)
                        observer.onError(error)
                    }
                    return Disposables.create()
                }
        }
    }
}
