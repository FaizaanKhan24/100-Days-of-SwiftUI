//
//  MissionListView.swift
//  Moonshot
//
//  Created by Faizaan Khan on 1/12/23.
//

import SwiftUI

struct MissionListView: View {
    let mission : Mission
    
    var body: some View {
        HStack(){
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
            
            VStack{
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(mission.formattedLaundDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

struct MissionListView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionListView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
