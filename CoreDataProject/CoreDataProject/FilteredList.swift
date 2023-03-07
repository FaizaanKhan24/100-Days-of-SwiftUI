//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Faizaan Khan on 3/7/23.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View> : View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    //Challenge 1, Challenge 2, Challenge 3
    init(filterKey: String, filterValue: String, filterPredicate: FilterPredicate, sortDescriptions: [NSSortDescriptor] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptions, predicate: NSPredicate(format: "%K \(filterPredicate.getPredicate()) %@", filterKey, filterValue))
        self.content = content
    }
}
