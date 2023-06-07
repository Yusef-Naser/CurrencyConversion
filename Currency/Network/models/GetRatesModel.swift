//
//  GetRatesModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class GetRatesModel : RequestModel {
    
    init () {
        super.init(url: "latest", httpMethod: .get , queryItems: [])
    }
    
}
