//
//  HistoryItem.swift
//  Currency
//
//  Created by yusef naser on 05/06/2023.
//

import CoreData

class HistoryItem : NSManagedObject {
    
    @NSManaged public var id : UUID
    @NSManaged public var fromSymbol : String
    @NSManaged public var toSymbol : String
    @NSManaged public var fromAmount : Double
    @NSManaged public var toAmount : Double
    @NSManaged public var timestamp : Int64
    @NSManaged public var date : Date
    
}

extension HistoryItem : Identifiable {
    
}
