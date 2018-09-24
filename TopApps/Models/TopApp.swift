//
//  Application.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import Foundation
import ObjectMapper

class TopApp: Mappable {
    
    var title:String?
    var thumbnail:String?
    var appIcon:String?
    var summary:String?
    var price:String?
    var link:String?
    var category:String?
    var publisher:publisher?
    var releaseDate:Date?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        title <- map["title.label"]
        thumbnail <- map["im:image.1.label"]
        appIcon <- map["im:image.2.label"]
        summary <- map["summary.label"]
        price <- map["im:price.label"]
        link <- map["link.attributes.href"]
        category <- map["category.attributes.label"]
        publisher <- map["im:artist"]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        releaseDate <- (map["im:releaseDate.label"],DateFormatterTransform(dateFormatter: dateFormatter))
    }
    
    
    
}
