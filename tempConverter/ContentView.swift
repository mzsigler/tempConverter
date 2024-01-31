//
//  ContentView.swift
//  tempConverter
//
//  Created by Mikel Sigler on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var inputScale = "Fahrenheit"
    
    
    let scales = ["Fahrenheit", "Celcius", "Kelvin"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input"){
                    TextField("Input", value: $input, format: .number)
                }
                                
                Section("Input Type") {
                    Picker("Tip Percentage", selection: $inputScale){
                        ForEach(scales, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
            }
            .navigationTitle("Temp Converter")
        }
    }
}


#Preview {
    ContentView()
}
