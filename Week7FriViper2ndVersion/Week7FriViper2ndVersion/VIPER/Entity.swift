//
//  Entity.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 13/05/2023.
//

import Foundation



struct Entity:Decodable {
let products : [Product]
}

struct Product : Decodable {
let id:Int
let title:String
}
