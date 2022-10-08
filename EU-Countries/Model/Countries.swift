//
//  Countries.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import Foundation



struct Country: Decodable {
    let flags: Flags
    let name: String
    let capital: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
}

struct Currency: Decodable {
    let name: String
}

struct Language: Decodable {
    let name: String
}
struct Flags: Decodable {
    let png: String
}
