//
//  TopAppCell.swift
//  TopApps
//
//  Created by Khalil Maidani on 2018-09-23.
//  Copyright © 2018 Khalil Maidani. All rights reserved.
//

import UIKit
import SDWebImage

class TopAppCell: UITableViewCell {
    @IBOutlet var title: UILabel?
    @IBOutlet var icon: UIImageView?
    @IBOutlet var date: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        icon?.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTopApp(topApp:TopApp) {
        title?.text = topApp.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        if let releaseDate = topApp.releaseDate {
            date?.text = dateFormatter.string(from: releaseDate)
        }
        
        if let thumbnail = topApp.thumbnail {
            icon?.sd_setImage(with: URL(string: thumbnail), completed: nil)
        }
    }

}
