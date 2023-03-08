//
//  ContentView.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    HStack(alignment: .center) {
                        Text(user.name)
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
        .task {
            await loadData()
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
