//
//  dataProvideer.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/24.
//

import Foundation

class DataProvider{
    
    var characters:[Character]? = nil
    
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
