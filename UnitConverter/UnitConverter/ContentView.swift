//
//  ContentView.swift
//  UnitConverter
//
//  Created by Harrison Enyeart on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var convertedUnit = ""
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var inputUnitToMilliliter: Double {
            switch inputUnit {
            case "mL":
                return inputValue
            case "Liters":
                return inputValue * literToMilliliter
            case "Cups":
                return inputValue * cupToMilliliter
            case "Pints":
                return inputValue * pintToMilliliter
            default:
                return inputValue * gallonToMilliliter
            }
        }

    var outputValue: Double {
        switch convertedUnit {
        case "mL":
            return inputUnitToMilliliter
        case "Liters":
            return inputUnitToMilliliter / literToMilliliter
        case "Cups":
            return inputUnitToMilliliter / cupToMilliliter
        case "Pints":
            return inputUnitToMilliliter / pintToMilliliter
        default:
            return inputUnitToMilliliter / gallonToMilliliter
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input value and unit") {
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convert to") {
                    Picker("Unit", selection: $convertedUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    if (convertedUnit == "") {
                        Text("")
                    }
                    else {
                        Text("\(outputValue, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("Volume Converter")
        }
    }
}
#Preview {
    ContentView()
}
