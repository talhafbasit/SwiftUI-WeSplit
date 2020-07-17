//
//  ContentView.swift
//  WeSplit13
//
//  Created by Talha Basit on 7/16/20.
//  Copyright © 2020 Talha Basit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalBill: Double {
        
        return totalPerPerson * Double(numberOfPeople + 2)
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total Bill")) {
                    Text("$\(totalBill, specifier: "%.2f")")
                    
                }
               
            }
            .navigationBarTitle("BananaSplit")
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

