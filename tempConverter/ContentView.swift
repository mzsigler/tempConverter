//
//  ContentView.swift
//  tempConverter
//
//  Created by Mikel Sigler on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var inputType = "Fahrenheit"
    @State private var outputType = "Celcius"
    
    var output: Double {
        
        var baseInput = 0.0
        var displayOutput = 0.0
        
        if inputType == "Kelvin" {
             baseInput = input
        }
        
        if inputType == "Fahrenheit" {
            baseInput = (input + 459.67) / 1.8
        }
        
        if inputType == "Celcius" {
             baseInput = input + 273.15
        }
        
        if outputType == "Kelvin" {
            displayOutput = baseInput
        }
        
        if outputType == "Celcius" {
            displayOutput = baseInput - 273.15
        }
        
        if outputType == "Fahrenheit" {
            displayOutput = baseInput * 1.8 - 459.67
        }
        
        return displayOutput
        
    }
    
    
    let inputScales = ["Fahrenheit", "Celcius", "Kelvin"]
    let outputScales = ["Fahrenheit", "Celcius", "Kelvin"]
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                                
                Section("Input Type") {
                    Picker("Input", selection: $inputType){
                        ForEach(inputScales, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Input"){
                    TextField("Input", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Output Type") {
                    Picker("Output", selection: $outputType){
                        ForEach(outputScales, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Text("\(input.formatted()) in \(inputType) is \(output.formatted()) in \(outputType)")
                    


                
            }
            .navigationTitle("Temp Converter")
        }
    }
}


#Preview {
    ContentView()
}
