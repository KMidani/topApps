//
//  TopAppsListVC.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import UIKit

class TopAppsListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var topApps : Array<TopApp> = []
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAppsList()
    }
    
    func loadAppsList (){
        TAApiManager.fetchTopApps(){ applist , error in
            if let error = error {
                print("\(error.localizedDescription)")
            }else {
                self.topApps = applist
                self.tableView?.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Appcell", for: indexPath) as! TopAppCell
        cell.setTopApp(topApp: topApps[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showAppDetails", sender: topApps[indexPath.row])
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVc = segue.destination as! TopAppDetailVC
        detailVc.topApp = sender as? TopApp
    }
 

}
