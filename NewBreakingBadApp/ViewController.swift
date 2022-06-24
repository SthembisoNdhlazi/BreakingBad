//
//  ViewController.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/23.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var characters = [Character]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Breaking bad"
        downloadJson {
            self.tableView.reloadData()
            print("Success")
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        
        let character = characters[indexPath.row]
        cell.characterImage.downloaded(from: character.img)
        cell.nameLabel.text = character.name
        cell.nicknameLabel.text = character.nickname
        cell.ageLabel.text = character.birthday
   
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.character = characters[tableView.indexPathForSelectedRow!.row]
        }
        
    }
    
    func downloadJson(completed: @escaping ()->()){
        let url = URL(string: "https://breakingbadapi.com/api/characters")
        URLSession.shared.dataTask(with: url!){ data, response, error in
            
            if error == nil{
                do{
                    self.characters = try JSONDecoder().decode([Character].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("error fetching data")
                }
               
                
               
            }
        }
        .resume()
    }

}



