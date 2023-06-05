//
//  CurrencyApp.swift
//  Currency
//
//  Created by yusef naser on 03/06/2023.
//

import SwiftUI

@main
struct CurrencyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
              //  .environment(\.managedObjectContext, persistenceController.container.viewContext)
            ConvertCurrencyView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
