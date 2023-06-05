//
//  CurrencyEntity.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import Foundation
import Combine

struct CurrencyEntity : Decodable , Identifiable {
    
    var id = UUID()
    var country : String
    var symbol : String
    
    enum CodingKeys: String,  CodingKey {
        case country
        case symbol
    }
    
}

