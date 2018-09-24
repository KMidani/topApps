//
//  TopAppDetailVC.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import UIKit
import SDWebImage

class TopAppDetailVC: UIViewController {
    
    public var topApp : TopApp?
    
    @IBOutlet var appIcon : UIImageView?
    @IBOutlet var appName : UILabel?
    @IBOutlet var releaseDate : UILabel?
    @IBOutlet var summary : UILabel?
    @IBOutlet var category : UILabel?
    @IBOutlet var appPrice : UILabel?
    @IBOutlet var publisher : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = topApp?.title
        fillTopApp()
    }
    
    func fillTopApp(){
        appName?.text = topApp?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        if let date = topApp?.releaseDate {
            releaseDate?.text = "Release Date: \(dateFormatter.string(from: date))"
        }
        summary?.text = topApp?.summary
        category?.text = "Category: \(topApp?.category ?? "N/A")"
        appPrice?.text = "Price: \(topApp?.price ?? "N/A")"
        publisher?.text = "Publisher: \(topApp?.publisher?.name ?? "N/A")"
        
        if let icon = topApp?.appIcon {
            appIcon?.sd_setImage(with: URL(string: icon), completed: nil)
        }
    }
    
    @IBAction func openInStore(_ sender: UIButton) {
        guard let link = topApp?.link else { return }
        print(link)
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func publisherWebSite(_ sender: UIButton) {
        guard let link = topApp?.publisher?.link else { return }
        print(link)
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
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
