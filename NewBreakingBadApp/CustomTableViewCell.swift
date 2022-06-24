//
//  CustomTableViewCell.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var nicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
