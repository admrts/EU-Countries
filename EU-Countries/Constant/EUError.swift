//
//  EUError.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import Foundation

enum EUError: String, Error {
    case invalidUrl         = "Url is not correct"
    case unableToComplete   = "Unable complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
