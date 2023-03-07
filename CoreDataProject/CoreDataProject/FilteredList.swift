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
    
    //Challenge 1
    init(filterKey: String, filterValue: String, filterPredicate: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(filterPredicate) %@", filterKey, filterValue))
        self.content = content
    }
}
