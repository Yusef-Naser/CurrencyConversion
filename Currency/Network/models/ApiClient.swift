//
//  ApiClient.swift
//  Currency
//
//  Created by yusef naser on 07/06/2023.
//

import Foundation

class ApiClient <T : Decodable > : NSObject {
    
    
    func performRequest (request : URLRequest , decoder: JSONDecoder = JSONDecoder(), completionError:@escaping ( Error )->Void? , completionSuccess:@escaping ( T )->Void? ) {
        
        let session = URLSession.shared

        let task = session.dataTask(with: request) { (data , response , error) in
            DispatchQueue.main.async {
                
                if let e = error {
                    completionError( e )
                    return
                }
                if let data = data  {
                    do{
                        let responseModel = try decoder.decode(T.self, from: data)
                        
                        completionSuccess( responseModel )
                    }catch(let e){
                        completionError(e)
                    }
                }
            }
            
        }
        task.resume()
    }
}

