//
//  ContentView.swift
//  Photo-Library
//
//  Created by Faizaan Khan on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddImage = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
//                    Button{
//                        showAddImage = true
                        NavigationLink {
                            AddPhotoView()
//                        }
                    } label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(.blue.opacity(0.60))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
        }
        .navigationTitle("Photo Library")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    // Show list view
                } label: {
                    Label("Show List", systemImage: "list.bullet")
                }
            }
        }
        .sheet(isPresented: $showAddImage){
            Text("Test")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
