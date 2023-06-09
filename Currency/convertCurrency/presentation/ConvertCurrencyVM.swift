//
//  ConvertCurrencyVM.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import Foundation
import Combine

class ConvertCurrencyVM : ObservableObject {
    
    let viewContext = PersistenceController.shared.container.viewContext
    
    @Published var convertedCurrency : ConvertCurrencyEntity?
    
    @Published var currency_1 = CurrencyEntity(country: "Select", symbol: "Select")
    @Published var currency_2 = CurrencyEntity(country: "Select", symbol: "Select")
    @Published var amountFrom : String = "1"
    @Published var amountTo : String = "0"
    
    var rateCurrency_1 : Double = 0.0
    var rateCurrency_2 : Double = 0.0
    var lastTimeStamp : Int64 = 0
    
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func conversionCurrencies () {
        guard (currency_1.country != "Select" && currency_2.country != "Select") else {
            showAlert = true
            errorMessage = "Please select both Currenceis"
            return
        }
        
        getConvertedCurrency( currency: currency_1) { [weak self] rate in
            self?.rateCurrency_1 = rate.round(to: 2)
            self?.getConvertedCurrency(currency: self?.currency_2) { [weak self] rate in
                self?.rateCurrency_2 = rate.round(to: 2)
                self?.getRate()
                self?.saveObjectToCoreData()
            }
        }
    }
    
    func getRate() {
        let rate_1 = 1 / rateCurrency_1 ;
        let rate_2 = 1 / rateCurrency_2 ;
        
        let rate = rate_1 / rate_2 ;
        
        
        let amountFromDouble = Double(amountFrom) ?? 0
        var amountToDouble = Double(amountTo) ?? 0
        
        amountToDouble = (amountFromDouble * rate ).round(to: 2)
        amountTo = "\(amountToDouble)"
    }
    
    func switchValues () {
        let currencyObjectTemp = self.currency_1
        self.currency_1 = self.currency_2
        self.currency_2 = currencyObjectTemp
        
        let rateTemp = rateCurrency_1
        self.rateCurrency_1 = self.rateCurrency_2
        self.rateCurrency_2 = rateTemp
        amountFrom = "1"
        amountTo = "0"
        getRate()
    }
    
    func saveObjectToCoreData () {
        let history = HistoryItem(context: viewContext)
        history.id = UUID()
        history.fromAmount = Double(amountFrom) ?? 0
        history.fromSymbol = currency_1.symbol
        history.toAmount = Double(amountTo) ?? 0
        history.toSymbol = currency_2.symbol
        history.timestamp = self.lastTimeStamp
        history.date = Date()
        
        DispatchQueue.main.async {
            do{
                try self.viewContext.save()
            }catch {
                print(error)
            }
        }
    }
    
    func loadResult (convert : ConvertCurrencyEntity) {
        self.convertedCurrency = convert
        if let error =  self.convertedCurrency?.error {
            self.errorMessage = error.info ?? "Error"
            self.showAlert = true
        }
        self.lastTimeStamp = Int64(self.convertedCurrency?.timestamp ?? 0)
    }
    
    func loadError(error : Error) {
        self.errorMessage = error.localizedDescription
        self.showAlert = true
    }
    
    private func getConvertedCurrency ( currency : CurrencyEntity? ,  rate : @escaping (_ rate : Double)->Void ) {

        let model = GetConvertModel(symbols: currency?.symbol )
        ApiClient<ConvertCurrencyEntity>().performRequest(request: model.buildRequest()) { error  in
             
            self.loadError(error: error)
             
        } completionSuccess: { currencies in
            self.loadResult(convert: currencies)
            rate(self.convertedCurrency?.rates?[currency?.symbol ?? ""] ?? 0)
        }
        
        
    }
    
}
