//
//  CharacterInformation.swift
//  NewBreakingBadApp
//
//  Created by IACD-020 on 2022/06/23.
//

import Foundation

struct Character:Decodable{
    let char_id:Int
    let name:String
    let nickname:String
    let status:String
    let portrayed:String
    let img:String
    let occupation : [String]
    let birthday:String
}

struct Quotes:Decodable{
    let quote_id:Int
    let quote:String
    let author:String
    
}


