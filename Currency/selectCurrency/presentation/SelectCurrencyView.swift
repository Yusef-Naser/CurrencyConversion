//
//  SelectCurrencyView.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var viewModel = SelectCurrencyVM()
    
    @Binding var selectedItem : CurrencyEntity
    
    var body: some View {
            VStack {
                SearchBarView(text: $viewModel.searchText)
                    .padding(.top , 16)
                
                List ( (viewModel.currencies?.currencies ?? [] ).filter({ viewModel.searchText.isEmpty ? true  : ($0.country.contains(viewModel.searchText) || $0.symbol.contains(viewModel.searchText))  }) ){ currency in
                    CurrencyItem(currency: currency)
                        .onTapGesture {
                            selectedItem = currency
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
                
                
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text(viewModel.errorMessage))
            })
            .navigationTitle("Currencies")
        
    }
}

struct SelectCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrencyView( selectedItem: .constant(CurrencyEntity(country: "", symbol: "")))
    }
}
