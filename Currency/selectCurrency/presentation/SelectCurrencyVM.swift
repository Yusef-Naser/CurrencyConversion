//
//  SelectCurrencyVM.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import Combine
import Foundation

class SelectCurrencyVM : ObservableObject {
 
    @Published private(set) var currencies : CurrenciesEntity?
    @Published var showAlert = false
    @Published var errorMessage = ""
    @Published var searchText = ""
    
    init() {
        fetchCurrencies()
    }
    
    func loadCurrenceis (cur : CurrenciesEntity) {
        var localCurrencies = cur
        localCurrencies.createCurrencies()
        self.currencies = localCurrencies
        if let error =  self.currencies?.error {
            self.errorMessage = error.info ?? "Error"
            self.showAlert = true
        }
    }
    
    func fetchCurrencies () {

        let model = GetCurrenciesModel( httpMethod: .get, queryItems: [])
        ApiClient<CurrenciesEntity>().performRequest(request: model.buildRequest()) { error  in
             
            self.errorMessage = error.localizedDescription
            self.showAlert = true
             
        } completionSuccess: { currencies in
            self.loadCurrenceis(cur: currencies)
        }

        
    }

    
}
