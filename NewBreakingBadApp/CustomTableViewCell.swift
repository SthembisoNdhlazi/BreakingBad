//
//  CustomTableViewCell.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/24.
//

import UIKit

protocol Favouritable{
    func toggleFavourite(for cell:UITableViewCell)
    
}

class CustomTableViewCell: UITableViewCell {
    
    var favouriteDelegate:Favouritable?
    
    @IBOutlet var favButton: UIButton!
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
    
    func setUpContent(character:Character, isFavourite:Bool){
        nameLabel.text = character.name
        nicknameLabel.text = character.nickname
        characterImage.downloaded(from: character.img)
        ageLabel.text = character.birthday
        
        if isFavourite{
        favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

    @IBAction func favoriteButtonTapped(_ sender: Any) {
        print("tapped event on cell")
        
        favouriteDelegate?.toggleFavourite(for: self)
        
    }
}
