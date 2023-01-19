//
//  HabitSheetView.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/18/23.
//

import SwiftUI

struct HabitSheetView: View {
    @ObservedObject var activity: Activity
    
    @State private var habitName = ""
    @State private var habitDescription = ""
    @State private var habitStartDate = Date.now
    @State private var habitDayCount = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section("Habit Basics"){
                    TextField("Name", text: $habitName)
                    TextField("Description", text: $habitDescription)
                }
                
                Section("Habit Start Date"){
                    DatePicker("Start Date", selection: $habitStartDate, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                }
                
                Section("Habit Count"){
                    TextField("Optional", value: $habitDayCount, format: .number)
                }
            }
            .navigationTitle("Add new Habit")
            .toolbar {
                Button("Add"){
                    // Add new habit to list
                    let newHabit = Habit(name: habitName, description: habitDescription, startDate: habitStartDate, dayCount: habitDayCount)
                    activity.habits.append(newHabit)
                    dismiss()
                }
            }
        }
    }
}

struct HabitSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HabitSheetView(activity: Activity())
    }
}
