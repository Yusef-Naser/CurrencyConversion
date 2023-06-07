//
//  CurrencyView.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import SwiftUI

struct CurrencyView: View {
    
    @Binding var selectedCurrency : CurrencyEntity
    @Binding var amount : String
    @State var isActiveCurrency : Bool = false
    
    var body: some View {
        
        
        VStack (alignment: .center) {
            
            NavigationLink(
                destination: SelectCurrencyView( selectedItem: $selectedCurrency ), isActive: $isActiveCurrency) {
                
                    Button {
                        
                        isActiveCurrency = true
                        
                    } label: {
                        Text( selectedCurrency.symbol )
                        Image(systemName: "arrow.down")
                    }
                    
            }
        
            TextField("Amount", text: $amount )
                .multilineTextAlignment(.center)
                .frame( maxWidth: 100 , maxHeight: 50)
                .background(Color.gray)
                .cornerRadius(5)
                .keyboardType(.numberPad)
            
            
        }
    
        
        
        //.padding()
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(selectedCurrency: .constant(CurrencyEntity(country: "", symbol: "")), amount: .constant("3"), isActiveCurrency: false )
    }
}
