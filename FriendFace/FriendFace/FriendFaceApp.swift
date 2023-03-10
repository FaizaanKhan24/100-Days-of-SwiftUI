//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataContoller = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContoller.container.viewContext)
        }
    }
}
