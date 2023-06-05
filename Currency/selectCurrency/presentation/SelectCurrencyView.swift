//
//  SelectCurrencyView.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State var searchText = ""
    @ObservedObject var viewModel = SelectCurrencyVM()
    
    @Binding var selectedItem : CurrencyEntity
    
    var body: some View {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(.top , 16)
                
                List ( (viewModel.currencies?.currencies ?? [] ).filter({ searchText.isEmpty ? true  : ($0.country.contains(searchText) || $0.symbol.contains(searchText))  }) ){ currency in
                    CurrencyItem(currency: currency)
                        .onTapGesture {
                            selectedItem = currency
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
                
            }
            .navigationTitle("Currencies")
        
    }
}

struct SelectCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrencyView( selectedItem: .constant(CurrencyEntity(country: "", symbol: "")))
    }
}
