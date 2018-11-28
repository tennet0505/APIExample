//
//  Models.swift
//  APIExample
//
//  Created by Oleg Ten on 11/28/18.
//  Copyright © 2018 Oleg Ten. All rights reserved.
//

import Foundation
import ObjectMapper

class Service:Mappable {
    var id:Int?
    var iconUrl: String?
    var title: String?
    var coverUrl:String?
    var shortDescription:String?
    var fullDescription:String?
    
    init(iconUrl: String?, title: String? ) {
        self.iconUrl = iconUrl
        self.title = title
    }
    
    //Mappable
    required init?(map: Map) {}
    func mapping(map: Map) {
        id <- map["id"]
        iconUrl <- map["icon_url"]
        title <- map["title"]
        coverUrl <- map["cover_url"]
        shortDescription <- map["short_description"]
        fullDescription <- map["full_description"]
    }
}

