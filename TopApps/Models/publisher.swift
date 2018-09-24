//
//  publisher.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import Foundation
import ObjectMapper

class publisher: Mappable {
    var name : String?
    var link : String?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        name <- map["label"]
        link <- map["attributes.href"]
    }
}
