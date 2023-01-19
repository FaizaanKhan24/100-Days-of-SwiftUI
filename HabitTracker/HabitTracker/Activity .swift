//
//  Activity .swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/17/23.
//

import Foundation

class Activity : ObservableObject{
    @Published var habits = [Habit]()
}
