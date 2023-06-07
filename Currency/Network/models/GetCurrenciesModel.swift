//
//  GetCurrenciesModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class GetCurrenciesModel : RequestModel {

    init() {
        super.init(url: "symbols", httpMethod: .get, queryItems: [])
    }
    
    // add additional headers for specific model
    
}
