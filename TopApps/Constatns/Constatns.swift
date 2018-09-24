//
//  Constatns.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import Foundation

struct Constants {
    static let BaseUrl = "http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/"
    
    struct ApiURLs {
        static let TOP_APPS_URL = Constants.BaseUrl + "toppaidapplications/limit=100/json"
    }
}
