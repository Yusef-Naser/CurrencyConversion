//
//  CurrenciesEntity.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import Combine
import Foundation

struct CurrenciesEntity : Decodable , Identifiable  {
    
    var id = UUID()
    var success: Bool?
    var symbols: [String: String]?
    var currencies : [CurrencyEntity] = []
    
    enum CodingKeys: String, CodingKey{
        case success
        case symbols
    }


    mutating func createCurrencies () {
        guard let symbols = symbols else {
            return
        }
        
        var localCurrencies : [CurrencyEntity] = []
        for (key,value) in symbols {
            let c = CurrencyEntity(country: value, symbol: key)
            localCurrencies.append(c)
        }
        currencies = localCurrencies.sorted(by: { $0.symbol < $1.symbol })
    }
    
    
}
