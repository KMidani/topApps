//
//  TopAppDetailVC.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import UIKit

class TopAppDetailVC: UIViewController {
    
    public var topApp : TopApp?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = topApp?.title
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
