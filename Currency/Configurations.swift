//
//  Configurations.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import Foundation

struct Configurations {
    
    static var PUBLIC_URL = "http://data.fixer.io/api/"
    static var API_KEY = "280e4a769473e038a173eeae53f98d60"
    
    
    
}

extension Date {
    static func days(days:Int) -> Date {
        return Calendar.current.date(byAdding: .day , value: days, to: Date()) ?? Date()
    }
}
