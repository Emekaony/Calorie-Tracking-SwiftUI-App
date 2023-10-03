//
//  AddCalorieView.swift
//  CalorieTracker
//
//  Created by SHAdON . on 10/2/23.
//

import SwiftUI

struct AddCalorieView: View {
    // this is thr food list that we pass from the main view
    @ObservedObject var food_list: Calorie_food_map_list
    
    @State private var food: String = ""
    @State private var calorie: String = ""
    @State private var calorie_placeholder_text = "Insert calorie"
    @State private var food_placeholder_text = "Insert food"
    
    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 50)
                    .shadow(color: .gray, radius: 2, x: 0, y: 5)
                    .foregroundColor(.white)
                    .overlay(
                        TextField(calorie_placeholder_text, text: $calorie)
                            .multilineTextAlignment(.center)
                            .autocorrectionDisabled(true)
                    )
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 50)
                    .shadow(color: .gray, radius: 2, x: 0, y: 5)
                    .foregroundColor(.white)
                    .overlay(
                        TextField(food_placeholder_text, text: $food)
                            .multilineTextAlignment(.center)
                            .autocorrectionDisabled(true)
                    )
                Button {
                    if calorie.isEmpty || food.isEmpty {
                        print("Abeg enter the right thing!")
                    } else {
                        food_list.add_item(food: food, calorie: calorie)
                        food_list.showAddCalorieView = false
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 300, height: 50)
                        .padding(.top, 15)
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                        .foregroundColor(Color.blue)
                        .overlay(
                            Text("Add Entry")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                        )
                }
                Spacer()
            }
            .navigationTitle("Add Food View 🍔")
            .padding(.top, 15)
        }
    }
}

struct AddCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        AddCalorieView(food_list: Calorie_food_map_list())
    }
}
