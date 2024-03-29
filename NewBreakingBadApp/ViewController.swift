//
//  ViewController.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/23.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!
    
    
  
    
    let dataProvider = DataProvider()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Breaking bad"
        
        
        dataProvider.downloadJson { [self] in
            self.tableView.reloadData()
            
            if let charactersArray = dataProvider.characters{
            for character in charactersArray{
                    dataProvider.isFavourited.append(false)
                }
            }
        }
        
        dataProvider.getQuotes{
            print("Success")
        }
       
                
                
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.characters?.count ?? 0
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        
        if let characters = dataProvider.characters{
            let character = characters[indexPath.row]
            cell.setUpContent(character: character, isFavourite: dataProvider.isFavourited[indexPath.row])
        }
        
        
        cell.favouriteDelegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.character = dataProvider.characters![tableView.indexPathForSelectedRow!.row]
            destination.quote = dataProvider.quotes![tableView.indexPathForSelectedRow!.row]
        }
        
    }
    
   
}

extension ViewController:Favouritable{
    
    func toggleFavourite(for cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
        
        dataProvider.toggleFavourite(for: indexPath.row)
            tableView.reloadData()
        }
    }
    
   
    
    
}


