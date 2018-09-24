//
//  TAApiManager.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class TAApiManager {
    static func fetchTopApps(completion:@escaping (Array<TopApp>,Error?)->Void) {
        let path = URL(string: Constants.ApiURLs.TOP_APPS_URL)
        guard let url = path else { return }
        
        let session = URLSession(configuration: .default)
        let topAppsTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion([],error)
            } else if let data = data ,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                let json = try? JSON(data: data)
                
                guard let parsedJson = json else {
                    let parsingError = NSError(domain:"Custom App Error", code:1001, userInfo:nil)
                    completion([],parsingError)
                    return
                }
                
                let topApps = parsedJson["feed"]["entry"].rawString()
                
                let mapped = Mapper<TopApp>().mapArray(JSONString: topApps!)
                guard let mappedList = mapped else {
                    let parsingError = NSError(domain:"Custom App Error", code:1002, userInfo:nil)
                    completion([],parsingError)
                    return
                }
                
                DispatchQueue.main.async {
                    completion(mappedList,nil)
                }
            }
        }
        topAppsTask.resume()
    }
}
