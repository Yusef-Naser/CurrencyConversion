//
//  Configurations.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import Foundation

struct Configurations {
    
    static var PUBLIC_URL = "http://data.fixer.io/api/"
    static var API_KEY = "6aa470c02b403923638106ae21f3c04e"
    
}

extension Date {
    static func days(days:Int) -> Date {
        return Calendar.current.date(byAdding: .day , value: days, to: Date()) ?? Date()
    }
}


class ParseData<T : Decodable> {
    
    static func parseJsonData(data : Data) -> T? {
        let decode = JSONDecoder()
        do {
            var curr = try decode.decode(T.self , from: data)
            return curr
        }catch{
            print("Error fetching data from Pexels: \(error)")
        }
        return nil
    }

}
