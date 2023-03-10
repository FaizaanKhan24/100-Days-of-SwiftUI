//
//  ContentView.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var usersData: FetchedResults<CacheUser>
    
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(usersData, id: \.id) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    HStack(alignment: .center) {
                        Text(user.wrappedName)
                            .font(.headline)
                        Spacer()
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .navigationTitle("Friends Face")
        }
        .task { @MainActor in
            if usersData.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        let friendFaceURL = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: friendFaceURL) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse.self
                
                var localUsers = [CacheUser]()
                
                users.forEach { userData in
                    let cacheUser = CacheUser(context: moc)
                    cacheUser.id = userData.id
                    cacheUser.isActive = userData.isActive
                    cacheUser.name = userData.name
                    cacheUser.age = Int16(userData.age)
                    cacheUser.company = userData.company
                    cacheUser.email = userData.email
                    cacheUser.address = userData.address
                    cacheUser.about = userData.about
                    cacheUser.registered = userData.registered
                    cacheUser.tags = userData.tags.joined(separator: ",")
//                    cacheUser.friend = NSSet(object: userData.friends)
                    localUsers.append(cacheUser)
                }
                
                for i in 0..<users.count {
                    for userFriend in users[i].friends {
                        let newFriend = CacheFriend(context: moc)
                        newFriend.id = userFriend.id
                        newFriend.name = userFriend.name
                        
                        localUsers[i].addToFriend(newFriend)
                    }
                }
                
                try? moc.save()
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
