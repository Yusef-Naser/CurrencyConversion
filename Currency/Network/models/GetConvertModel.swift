//
//  GetConvertModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class GetConvertModel : RequestModel {
    
    init( symbols : String?) {
        super.init(url: "latest", httpMethod: .get, queryItems: [URLQueryItem(name: "symbols", value: symbols)])
    }
    
}
