//
//  UserView.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import SwiftUI

struct UserView: View {
    @State var user: CacheUser
    
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
                        Text(user.wrappedCompany)
                    }
                }
                
                Section("Contact info"){
                    HStack{
                        Text("Email")
                            .bold()
                        Spacer()
                        Text(user.wrappedEmail)
                    }
                    HStack{
                        Text("Address")
                            .bold()
                        Spacer()
                        Text(user.wrappedAddress)
                    }
                }
                
                Section("About") {
                    Text(user.wrappedAbout)
                }
                
                Section("Tags") {
                    ForEach(user.wrappedTags.components(separatedBy: ","), id: \.self){ tag in
                        Text(tag)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
                
                Section("Friends"){
                    ForEach(user.wrappedFriends, id: \.id){ friend in
                        Text(friend.wrappedName)
                    }
                }
                
                Section("Registered"){
                    Text(user.wrappedRegistered, style: .date)
                }
            }
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
