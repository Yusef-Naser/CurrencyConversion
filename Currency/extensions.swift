//
//  Configurations.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import Foundation

extension Date {
    static func days(days:Int) -> Date {
        return Calendar.current.date(byAdding: .day , value: days, to: Date()) ?? Date()
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
