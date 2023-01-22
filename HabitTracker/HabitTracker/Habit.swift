//
//  Habit.swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/17/23.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable{
    var id = UUID()
    var name: String
    var description: String
    var startDate: Date
    var dayCount: Int
}
