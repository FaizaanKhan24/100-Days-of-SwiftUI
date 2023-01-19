//
//  HabitView.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/18/23.
//

import SwiftUI

struct HabitView: View {
    @State private var selectedHabit: Habit = Habit(name: "Gym", description: "Work Out everyday", startDate: Date.now, dayCount: 7)
    
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
                        Stepper("Habit Count", value: $selectedHabit.dayCount)
                        HStack{
                            Spacer()
                            Text("\(selectedHabit.dayCount)")
                                .font(.largeTitle)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle(selectedHabit.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Update"){
                    // Do something
                }
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView()
    }
}
