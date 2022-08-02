//
//  dataProvideer.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/24.
//

import Foundation

class DataProvider{
    
    var characters:[Character]? = nil
    
    var quotes:[Quotes]? = nil
    
    var isFavourited = [Bool]()
    
    func downloadJson(completed: @escaping ()->()){
        let url = URL(string: "https://breakingbadapi.com/api/characters")
        URLSession.shared.dataTask(with: url!){ [self] data, response, error in
            
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
    
    
    func getQuotes(completed: @escaping ()->()){
        let url = URL(string: "https://breakingbadapi.com/api/quotes")
        URLSession.shared.dataTask(with: url!){ [self] data, response, error in
            
            if error == nil{
                do{
                    self.quotes = try JSONDecoder().decode([Quotes].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                    print(quotes?.count)
                    
                } catch{
                    print("Error fetching quotes")
                }
            }
        }.resume()
    }
    
    func toggleFavourite(for index:Int){
        
       print("toggled")
        
        isFavourited[index].toggle()
    }
}
