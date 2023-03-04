//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Faizaan Khan on 3/2/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataContoller = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContoller.container.viewContext)
        }
    }
}
