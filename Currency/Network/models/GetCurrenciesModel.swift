//
//  GetCurrenciesModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class GetCurrenciesModel : RequestModel {

    init( httpMethod: HTTPMethod, queryItems: [URLQueryItem]) {
        super.init(url: "symbols", httpMethod: httpMethod, queryItems: queryItems)
    }
    
    // add additional headers for specific model
    
}
