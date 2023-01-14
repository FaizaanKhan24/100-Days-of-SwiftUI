//
//  CrewLabelView.swift
//  Moonshot
//
//  Created by Faizaan Khan on 1/11/23.
//

import SwiftUI

struct CrewLabelView: View {
    let crewMember: CrewMember
    
    var body: some View {
        HStack{
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading){
                Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

struct CrewLabelView_Previews: PreviewProvider {
    static let astronaut = Astronaut(id: "armstrong", name: "Neil A. Armstrong", description: "Test")
    static let crewMember = CrewMember(role: "Commander", astronaut: astronaut)
    
    static var previews: some View {
        CrewLabelView(crewMember: crewMember)
    }
}
