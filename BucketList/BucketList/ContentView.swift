//
//  ContentView.swift
//  BucketList
//
//  Created by Faizaan Khan on 3/15/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isUnlocked{
//            if true {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate){
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.addLocation()
                        } label: {
                            // Challenge 1
                            Image(systemName: "plus")
                                .padding()
                                .background(.black.opacity(0.75))
                                .foregroundColor(.white)
                                .font(.title)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                }
            } else {
                Button("Unlock Places") {
                    viewModel.authenticate()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .sheet(item: $viewModel.selectedPlace) { place in
            EditView(location: place) { newLocation in
                viewModel.update(location: newLocation)
            }
        }
        // Challenge 2
        .alert(viewModel.alertTitle,isPresented: $viewModel.showAlert){
            Button("Ok") { }
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
