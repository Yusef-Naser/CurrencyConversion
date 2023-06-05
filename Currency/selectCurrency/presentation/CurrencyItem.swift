//
//  CurrencyItem.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import SwiftUI

struct CurrencyItem: View {
    
    var currency : CurrencyEntity
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text(currency.symbol)
                .fontWeight(.semibold)
            
            Text(currency.country)
                .fontWeight(.light)
                .font(.system(size: 15, weight: .light , design: .rounded))
                
            
        }
    }
}

struct CurrencyItem_Previews: PreviewProvider {
    static var previews: some View {
       // CurrencyItem(countryName: "United Arab Emirates Dirham" , countrySymbol: "AED")
        CurrencyItem(currency: CurrencyEntity(country: "United Arab Emirates Dirham", symbol: "AED"))
    }
}
