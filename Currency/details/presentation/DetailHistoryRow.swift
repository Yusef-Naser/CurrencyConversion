//
//  DetailHistoryRow.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import SwiftUI

struct DetailHistoryRow: View {
    
    var item : HistoryItem
    
    var body: some View {
        VStack (alignment: .leading ) {
            HStack {
                Text("\(item.fromAmount.round(to: 2))")
                Text("\(item.fromSymbol)")
            }
            
            Spacer()
            HStack {
                Text("\(item.toAmount.round(to: 2))")
                Text("\(item.toSymbol)")
            }
            
        }
    }
}

struct DetailHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailHistoryRow(item: HistoryItem() )
    }
}
