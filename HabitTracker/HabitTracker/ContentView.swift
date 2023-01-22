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
                            HabitView(activity: activities, selectedHabit: habitItem)
                        } label: {
                            HabitItemView(habit: habitItem)
                        }
                    }
                    .onDelete(perform: removeHabit)
                }
                .navigationTitle("Habit Tracker")
                .toolbar {
                    Button(){
                        isShowAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $isShowAddHabit){
                    HabitSheetView(activity: activities)
                }
            }
        }
    }
    
    func removeHabit(at offsets: IndexSet){
        activities.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
