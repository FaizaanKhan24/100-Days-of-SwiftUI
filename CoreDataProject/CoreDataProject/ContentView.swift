//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Faizaan Khan on 3/6/23.
//

import CoreData
import SwiftUI

enum FilterPredicate{
    case beginWith, endswith
    
    func getPredicate() -> String{
        switch self {
        case .beginWith:
            return "BEGINSWITH"
        case .endswith:
            return "ENDSWITH"
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    let sortOrder = [
        NSSortDescriptor(key: "lastName", ascending: false)
    ]
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, filterPredicate: FilterPredicate.beginWith, sortDescriptions: sortOrder) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
