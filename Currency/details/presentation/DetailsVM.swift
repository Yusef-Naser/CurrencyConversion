//
//  DetailsVM.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import Combine
import Foundation

class DetailsVM : ObservableObject {
    
    @Published var convertedCurrency : ConvertCurrencyEntity?
 
    init() {
       // getLatestCurrency()
    }
    
    func getLatestCurrency () {
        
        let publicUrl = Configurations.PUBLIC_URL + "latest?access_key=" + Configurations.API_KEY
        
        guard let url = URL(string:  publicUrl ) else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.convertedCurrency = self.parseJsonData (data : data )
                    self.convertedCurrency?.createCurrencies()
                }
            }
        }
        task.resume()
    }
    
    private func parseJsonData(data : Data ) -> ConvertCurrencyEntity? {
        let decode = JSONDecoder()
        do {
            let curr = try decode.decode(ConvertCurrencyEntity.self , from: data)
            return curr
        }catch{
            print("Error fetching data from Pexels: \(error)")
        }
        return nil
    }
    
    
    
}
