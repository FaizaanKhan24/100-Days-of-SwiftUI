//
//  StackDividerView.swift
//  Moonshot
//
//  Created by Faizaan Khan on 1/11/23.
//

import SwiftUI

struct StackDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct StackDividerView_Previews: PreviewProvider {
    static var previews: some View {
        StackDividerView()
    }
}
