//
//  ContentView.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activity()
    
    @State private var isShowAddHabit = false
    
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    ForEach(activities.habits){ habitItem in
                        NavigationLink{
                            HabitView()
                        } label: {
                            HabitItemView(habit: habitItem)
                        }
                    }
                }
                .navigationTitle("Habit Tracker")
                .toolbar {
                    Button(){
                        activities.habits.append(Habit(name: "Gym Test", description: "To work out", startDate: Date.now, dayCount: 7))
                        
                        isShowAddHabit.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $isShowAddHabit){
                    HabitSheetView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
