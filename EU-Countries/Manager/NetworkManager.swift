//
//  NetworkManager.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import Foundation
import Alamofire



class NetworkManager {
    static let shared = NetworkManager()
    let url = "https://restcountries.com/v2/regionalbloc/eu"
    
    func getCountries(completion: @escaping (Result<[Country], EUError>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        AF.request(url).response { result in
            if let _ = result.error {
                completion(.failure(.invalidUrl))
            }
            guard let response = result.response, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = result.data else {
                completion(.failure(.invalidData))
                return
            }
            let decoder = JSONDecoder()
            do {
                let countries = try decoder.decode([Country].self, from: data)
                completion(.success(countries))
            }catch {
                completion(.failure(.invalidData))
            }
            
        }
    }
}
