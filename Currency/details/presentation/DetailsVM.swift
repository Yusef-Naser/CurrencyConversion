//
//  DetailsVM.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import Combine
import Foundation

class DetailsVM : ObservableObject {
    
    @Published var convertedCurrency : ConvertCurrencyEntity?
 
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    init() {
       
    }
    
    
    func loadResult (result : ConvertCurrencyEntity) {
        self.convertedCurrency = result
        if let error =  self.convertedCurrency?.error {
            self.errorMessage = error.info ?? "Error"
            self.showAlert = true
        }
        self.convertedCurrency?.createCurrencies()
    }
    
    func loadError (error : Error) {
        self.errorMessage = error.localizedDescription
        self.showAlert = true
    }
    
    func getLatestCurrency () {
        
        let model = GetRatesModel()
        ApiClient<ConvertCurrencyEntity>().performRequest(request: model.buildRequest()) { error  in
             
            self.loadError(error: error)
             
        } completionSuccess: { currencies in
            self.loadResult(result: currencies)
        }
        
        
    }
    
}
