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
    @Published var showAlert = false
    @Published var errorMessage = ""
    @Published var searchText = ""
    
    init() {
        fetchCurrencies()
    }
    
    func fetchCurrencies () {
        guard let url = URL(string: Configurations.PUBLIC_URL + "symbols?access_key=" + Configurations.API_KEY ) else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    var currencies = ParseData<CurrenciesEntity>.parseJsonData(data: data)
                    //self.currencies = parseJsonData (data : data)
                    currencies?.createCurrencies()
                    self.currencies = currencies
                    if let error =  self.currencies?.error {
                        self.errorMessage = error.info ?? "Error"
                        self.showAlert = true
                    }
                    
                }
            }
        }
        task.resume()
    }
    
//    private func parseJsonData(data : Data) -> CurrenciesEntity? {
//        let decode = JSONDecoder()
//        do {
//            var curr = try decode.decode(CurrenciesEntity.self , from: data)
//            curr.createCurrencies()
//            return curr
//        }catch{
//            print("Error fetching data from Pexels: \(error)")
//        }
//        return nil
//    }
    
    
}
