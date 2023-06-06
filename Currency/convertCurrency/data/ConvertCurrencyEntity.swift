//
//  ConvertCurrencyEntity.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import Foundation

struct ConvertCurrencyEntity : Decodable {
    
    let success: Bool?
    let timestamp: Int?
    let base, date: String?
    let rates: [String : Double]?
    let error: APIError?
    var rateCurrencies : [RateCurrencyEntity]?
    
    enum CodingKeys: CodingKey {
        case success
        case timestamp
        case base
        case date
        case rates
        case error
    }
    
    mutating func createCurrencies () {
        guard let rates = rates else {
            return
        }
        
        var localCurrencies : [RateCurrencyEntity] = []
        for (key,value) in rates {
            let c = RateCurrencyEntity(rate: value, symbol: key)
            localCurrencies.append(c)
        }
        rateCurrencies = localCurrencies.sorted(by: { $0.symbol < $1.symbol })
    }
    
}

struct RateCurrencyEntity : Codable , Identifiable {
    
    var id = UUID()
    var rate : Double
    var symbol : String
    
    enum CodingKeys: String,  CodingKey {
        case rate
        case symbol
    }
}

struct APIError: Codable {
    let code: Int?
    let info: String?
}
