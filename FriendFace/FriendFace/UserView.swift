//
//  UserView.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import SwiftUI

struct UserView: View {
    @State var user: User
    
    var body: some View {
        VStack{
            Form{
                Section{
                    HStack{
                        Text("Age")
                            .bold()
                        Spacer()
                        Text(String(user.age))
                    }
                    HStack{
                        Text("Company")
                            .bold()
                        Spacer()
                        Text(user.company)
                    }
                }
                
                Section("Contact info"){
                    HStack{
                        Text("Email")
                            .bold()
                        Spacer()
                        Text(user.email)
                    }
                    HStack{
                        Text("Address")
                            .bold()
                        Spacer()
                        Text(user.address)
                    }
                }
                
                Section("About") {
                    Text(user.about)
                }
                
                Section("Tags") {
                    ForEach(user.tags, id: \.self){ tag in
                        Text(tag)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
                
                Section("Friends"){
                    ForEach(user.friends, id: \.id){ friend in
                        Text(friend.name)
                    }
                }
                
                Section("Registered"){
                    Text(user.registered, style: .date)
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
