//
//  LatestRow.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import SwiftUI

struct LatestRow: View {
    
    var rate : RateCurrencyEntity
    
    var body: some View {
        HStack {
            
            Text(rate.symbol + ": ")
            Text("\(rate.rate.round(to: 2))")
            
        }
    }
}

struct LatestRow_Previews: PreviewProvider {
    static var previews: some View {
        LatestRow(rate: RateCurrencyEntity( rate: 90, symbol: "SA"))
    }
}
