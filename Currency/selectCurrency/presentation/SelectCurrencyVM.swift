//
//  SelectCurrencyVM.swift
//  Currency
//
//  Created by yusef naser on 04/06/2023.
//

import Combine
import Foundation

class SelectCurrencyVM : ObservableObject {
 
    @Published private(set) var currencies : CurrenciesEntity?
    
    init() {
        fetchCurrencies()
    }
    
    func fetchCurrencies () {
        guard let url = URL(string: Configurations.PUBLIC_URL + "symbols?access_key=" + Configurations.API_KEY ) else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.currencies = self.parseJsonData (data : data)
                }
            }
        }
        task.resume()
    }
    
    private func parseJsonData(data : Data) -> CurrenciesEntity? {
        let decode = JSONDecoder()
        do {
            var curr = try decode.decode(CurrenciesEntity.self , from: data)
            curr.createCurrencies()
            return curr
        }catch{
            print("Error fetching data from Pexels: \(error)")
        }
        return nil
    }
    
    
}
