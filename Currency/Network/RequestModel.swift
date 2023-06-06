//
//  RequestModel.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class RequestModel : BaseRequestModel {
 
    init(url : String , httpMethod : HTTPMethod , queryItems : [URLQueryItem] ) {
        super.init()
        self.PUBLIC_URL += url
        self.httpMethod = httpMethod
        
        self.queryItems = queryItems
        self.queryItems.append(URLQueryItem(name: "access_key", value: self.API_KEY))
    }
    
    func buildRequest () -> URLRequest{
        
        let url = self.PUBLIC_URL
        let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        var urlComps = URLComponents(string: safeUrl)!
        urlComps.queryItems = queryItems
        var urlRequest = URLRequest(url: urlComps.url!)
        urlRequest.httpMethod = self.httpMethod.rawValue
        return urlRequest
    }
    
}
