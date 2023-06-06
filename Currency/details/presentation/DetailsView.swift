//
//  DetailsView.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import SwiftUI

struct DetailsView: View {
    
    @FetchRequest(entity: HistoryItem.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \HistoryItem.timestamp , ascending: false ) ], predicate: NSPredicate(format: "date >= %@", Date.days(days: -3) as NSDate )  )
    var historyItems: FetchedResults<HistoryItem>
    
    @ObservedObject var viewModel = DetailsVM()
    
    var body: some View {
        
        HStack {
            
            List (historyItems) { item in
                DetailHistoryRow(item: item)
            }

            List (viewModel.convertedCurrency?.rateCurrencies ?? []){ rate in
                LatestRow(rate: rate)
            }
            
        }
        .onAppear{
            self.viewModel.getLatestCurrency()
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
