//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Faizaan Khan on 2/27/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var newOrder: NewOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $newOrder.order.name)
                TextField("Street Address", text: $newOrder.order.streetAddress)
                TextField("City", text: $newOrder.order.city)
                TextField("Zip", text: $newOrder.order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(newOrder: newOrder)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(newOrder.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(newOrder: NewOrder(order: OrderItems()))
        }
    }
}
