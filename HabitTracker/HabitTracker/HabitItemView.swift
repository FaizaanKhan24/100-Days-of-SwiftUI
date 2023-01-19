//
//  HabitItemView.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/18/23.
//

import SwiftUI

struct HabitItemView: View {
    var habit: Habit
    
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 5){
                Text(habit.name)
                    .font(.title2.bold())
                Text(habit.startDate, format: .dateTime.year().month().day())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(String(habit.dayCount))
        }
    }
}

struct HabitItemView_Previews: PreviewProvider {
    static var testHabit = Habit(name: "Gym", description: "Work Out everyday", startDate: Date.now, dayCount: 7)
    
    static var previews: some View {
        HabitItemView(habit: testHabit)
    }
}
