//
//  Mocks.swift
//  CurrencyTests
//
//  Created by yusef naser on 07/06/2023.
//

@testable import Currency

class Mocks {
    
    static let currencyEntities = [
        CurrencyEntity(country: "Egypt", symbol: "EGP" ) ,
        CurrencyEntity(country: "EURO", symbol: "EUR" ) ,
        CurrencyEntity(country: "United States Dollar", symbol: "USD" ) ,
      ]
    
    static let symbols = ["Egypt" : "EGP" , "EURO" : "EUR" , "United States Dollar" : "USD"]
    
    static let rates = ["Egypt" : 5.0 , "EURO" : 2.0  , "United States Dollar" : 3.0 ]
    
    static let currenciesEntities = CurrenciesEntity(success: true  ,
                                              symbols: symbols ,
                                              currencies: currencyEntities  ,
                                              error: APIError(code: 404, info: "Error Get Currencies"))
    
    static let convertCurrencyEntity = ConvertCurrencyEntity(success: true , timestamp: 200, base: "EUR", date: "01-01-2020", rates: rates , error: APIError(code: 404, info: "Error Get Conveted"))
    
}
