//
//  Activity .swift
//  HabitTracker
//
//  Created by Faizaan Khan on 1/17/23.
//

import Foundation

class Activity : ObservableObject{
    @Published var habits = [Habit](){
        didSet{
            let encoder = JSONEncoder()
            
            if let encodedData = try? encoder.encode(habits){
                UserDefaults.standard.set(encodedData, forKey: "Habits")
            }
        }
    }
    
    init(){
        let decoder = JSONDecoder()
        
        if let savedData = UserDefaults.standard.data(forKey: "Habits"){
            if let decodedItem = try? decoder.decode([Habit].self, from: savedData){
                habits = decodedItem
                return
            }
        }
        
        habits = []
    }
}
