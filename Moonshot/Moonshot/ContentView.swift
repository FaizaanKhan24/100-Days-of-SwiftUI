//
//  ContentView.swift
//  Moonshot
//
//  Created by Faizaan Khan on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var listGridToggle = "list.dash"
    @State private var isShowingGrid = true
    @State private var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astraunts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let SFListSymbol = "list.dash"
    let SFGridSymbol = "square.grid.2x2"
    
    let gridColumn = [
        GridItem(.adaptive(minimum: 150))
        ]
    let listColumn = [
        GridItem(.flexible(minimum: 100, maximum: .infinity))
        ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astraunts)
                        } label: {
                            if (isShowingGrid){
                                MissionGridView(mission: mission)
                            } else {
                                MissionListView(mission: mission)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar(){
                Button(){
                    toggleListGrid()
                } label: {
                    Image(systemName: "\(listGridToggle)")
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func toggleListGrid(){
        isShowingGrid.toggle()
        if isShowingGrid{
            columns = gridColumn
            listGridToggle = SFListSymbol
        } else {
            columns = listColumn
            listGridToggle = SFGridSymbol
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
