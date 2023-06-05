//
//  ConvertCurrencyView.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import SwiftUI

struct ConvertCurrencyView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel = ConvertCurrencyVM()
    
    @State var showDetails = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    
                    CurrencyView(selectedCurrency: $viewModel.currency_1, amount: $viewModel.amountFrom)
                    
                    VStack {
                        Button {
                            self.viewModel.switchValues()
                        } label: {
                            Image(systemName: "arrow.left.arrow.right")
                        }
                        
                        Button {
                            self.viewModel.conversionCurrencies()
                        } label: {
                            Text("Convert")
                        }
                        .padding(.top , 30)
                        
                    }
                    
                    CurrencyView(selectedCurrency: $viewModel.currency_2 , amount: $viewModel.amountTo)
                    
                    
                }
                .padding(.top , 50)
                
                NavigationLink(destination: DetailsView(), isActive: $showDetails) {
                    
                    Button {
                        showDetails = true
                    } label: {
                        Text("Details")
                            .foregroundColor(Color.white)
                            .padding()
                            
                    }
                    .background(Color.black)
                    .padding(.top , 50 )
                    
                }
                

                
                Spacer()
               
            }
            .navigationTitle("Currency Converter")
        }
        
        
    }
}

struct ConvertCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertCurrencyView()
    }
}
