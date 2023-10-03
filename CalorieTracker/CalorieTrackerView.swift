//
//  ContentView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/1/23.
//

import SwiftUI

struct CalorieTrackerView: View {
    
    @ObservedObject var food_list: Calorie_food_map_list = Calorie_food_map_list()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(food_list.food_map) {entry in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(entry.calorie) calories consumed")
                                Text("Food Eaten: \(entry.food)")
                            }
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(Color.red)
                                .onTapGesture {
                                    food_list.delete_item(item: entry)
                                    // print("delete button was tapped")
                                }
                        }
                    }
                }
                .navigationTitle("Calorie Tracker")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            food_list.showAddCalorieView.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.black)
                                .bold()
                        }
                    }
                }
                .sheet(isPresented: $food_list.showAddCalorieView) {
                    // show the AddCalorieView when I press the plus button on the main view
                    AddCalorieView(food_list: food_list)
                }
            }
            .background(Color.blue)
        }
    }
}

struct calorie_food_map: Equatable, Identifiable {
    var id = UUID()
    var calorie: String
    var food: String
}

class Calorie_food_map_list: ObservableObject {
    @Published var food_map: [calorie_food_map] = []
    @Published var showAddCalorieView: Bool = false
    
    func add_item(food: String, calorie: String) {
        food_map.append(calorie_food_map(calorie: calorie, food: food))
    }
    
    func delete_item(item: calorie_food_map) {
        if let idx = food_map.firstIndex(of: item) {
            food_map.remove(at: idx)
        }
    }
}

struct CalorieTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieTrackerView()
    }
}
