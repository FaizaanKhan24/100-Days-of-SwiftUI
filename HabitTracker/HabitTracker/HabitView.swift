//
//  HabitView.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/18/23.
//

import SwiftUI

struct HabitView: View {
//    @State private var selectedHabit: Habit = Habit(name: "Gym", description: "Work Out everyday", startDate: Date.now, dayCount: 7)
    
    @ObservedObject var activity: Activity
    @State var selectedHabit: Habit
    @State private var newCount = 0
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.gray.ignoresSafeArea()
            
            VStack(alignment: .leading){
                Form{
                    Section("Habit Details"){
                        HStack{
                            Text("Name")
                            Spacer()
                            Text(selectedHabit.name)
                        }
                        
                        HStack{
                            Text("Description")
                            Spacer()
                            Text(selectedHabit.description)
                        }
                        
                        HStack{
                            Text("Date")
                            Spacer()
                            Text(selectedHabit.startDate, format: .dateTime.year().month().day())
                        }
                    }
                    
                    Section("Habit Streak"){
                        Stepper("Habit Count", value: $newCount)
                        HStack{
                            Spacer()
                            Text("\(newCount)")
                                .font(.largeTitle)
                            Spacer()
                        }
                    }
                }
            }
            .onAppear{
                newCount = selectedHabit.dayCount
            }
            .alert("Success!", isPresented: $showAlert){
                Button("Ok"){
                    // Dismiss
                }
            } message: {
                Text("Update successful")
            }
            .navigationTitle(selectedHabit.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Update"){
                    // Do something
                    let itemIndex = activity.habits.firstIndex(of:selectedHabit) ?? -1
                    selectedHabit.dayCount = newCount
                    if(itemIndex > -1){
                        activity.habits[itemIndex] = selectedHabit
                        showAlert = true
                    }
                }
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var testHabit = Habit(name: "Gym", description: "Work Out everyday", startDate: Date.now, dayCount: 7)
    
    static var previews: some View {
        HabitView(activity: Activity(), selectedHabit: testHabit)
    }
}
