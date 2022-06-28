//
//  DetailViewController.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/23.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (character?.occupation.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = character?.occupation[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = data
        return cell
    }
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var characterImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var actorLabel: UILabel!
    
  
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    var character:Character?
   
    var quote : Quotes?
    var dataProvider = DataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        dataProvider.getQuotes {
            
        }
        
        
        tableView.reloadData()
        self.tableView.dataSource = self
        self.tableView.delegate = self
       
        nameLabel.text = "Name: \(character?.name ?? "")"
        actorLabel.text = "portrayed by: \(character?.portrayed ?? "")"
       
        statusLabel.text = "Status:\(character?.status ?? "")"
        quoteLabel.text = "Quote\(quote?.quote ?? "")"
       
        
       
        characterImage.downloaded(from: character!.img)
    }

   
    
}


