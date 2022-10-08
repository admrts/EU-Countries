//
//  Countries.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import Foundation



struct Country: Decodable {
    let flag: String
    let name: String
    let capital: String
    let population: Int
    let timezones: [String]
    let currencies: [Currency]
    let languages: [Language]
    
}

struct Currency: Decodable {
    let name: String
    let symbol: String
}

struct Language: Decodable {
    let name: String

}
/*let c1 = Currency(name: "", symbol: "")
let c2 = Currency(name: "", symbol: "")
let c = [c1,c2]
let l1 = Language(name: "")
let l2 = Language(name: "")
let l = [l1,l2]
let d: [Country] = [a1,a2]
let a1 = Country(flag: "", name: "", capital: "", population: 1, timezones: ["",""], currencies: c, languages: l)
let a2 = Country(flag: "", name: "", capital: "", population: 1, timezones: ["",""], currencies: c, languages: l)
*/
