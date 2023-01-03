//
//  ContentView.swift
//  TipCalculator
//
//  Created by Дмитрий Имаев on 03.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0,5,10,15,20]
    
    var totalPerPerson: Double {
        let peopleCount = Double (numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField ("Amount", text: $checkAmount)
                    Picker ("Number of people", selection: $numberOfPeople){
                        ForEach(2..<21) {
                            Text("\($0) people")
                        }
                    }
                } .pickerStyle(.navigationLink)
                Section {
                    Picker(" ", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count, id: \.self) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                } .pickerStyle(.segmented)
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f") ")
                }
            } .navigationBarTitle("Tip Calculator", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
