//
//  BaseRequestModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

class BaseRequestModel {
    internal var httpMethod : HTTPMethod = .get
    internal var queryItems : [URLQueryItem] = []
    internal var PUBLIC_URL = "http://data.fixer.io/api/"
    internal var API_KEY = "6aa470c02b403923638106ae21f3c04e"
}
