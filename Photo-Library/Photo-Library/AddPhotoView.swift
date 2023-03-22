//
//  AddPhotoView.swift
//  Photo-Library
//
//  Created by Faizaan Khan on 3/22/23.
//

import SwiftUI

struct AddPhotoView: View {
    @State private var uiImage: UIImage?
    @State private var image : Image?
    @State private var showImagePicker = false
    @State private var name: String = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section("Image"){
                    ZStack(alignment: .bottomLeading){
                        image?
                            .resizable()
                            .scaledToFit()
                        Button ("Select Image") {
                            showImagePicker = true
                        }
                    }
                }
                
                Section {
                    TextField("Name:", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
        .sheet(isPresented: $showImagePicker){
            ImagePicker(image: $uiImage)
        }
    }
}
