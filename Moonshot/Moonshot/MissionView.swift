//
//  MissionView.swift
//  Moonshot
//
//  Created by Faizaan Khan on 1/11/23.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader{ geomentry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geomentry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack{
                        Text(mission.formattedLaundDate)
                            .foregroundColor(.secondary)
                            .padding(.top)
                            .font(.title)
                    }
                    
                    VStack(alignment: .leading){
                        StackDividerView()
                        
                        Text("Mission Hightlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        StackDividerView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    CrewLabelView(crewMember: crewMember)
                                }
                                .accessibilityElement()
                                .accessibilityLabel("\(crewMember.astronaut.name)")
                                .accessibilityHint(crewMember.role)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaunt = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaunt)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
