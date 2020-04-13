//
//  LengthConverter.swift
//  CalculateThat
//
//  Created by Christopher Walter on 4/12/20.
//  Copyright © 2020 Christopher Walter. All rights reserved.
//

import SwiftUI

struct LengthConverter: View {
    @State var originalAmount: String = ""
    @State var originalUnit: Int = 3 // this will be used to keep track of the units for the originalAmount. The number will link us to the index of the UnitTypes.
    var miles: Double {
        let numMeters = convertToMeters()
        print("origAmt: \(originalAmount)\n origUnit: \(unitTypes[originalUnit])\nnumMeters: \(numMeters)")
        
        return numMeters / 1609.344
    }
    var yards: Double {
        let numMeters = convertToMeters()
        return numMeters / 0.9144
    }
    var feet: Double {
        let numMeters = convertToMeters()
        return numMeters / 0.3048
    }
    var kilometers: Double {
        let numMeters = convertToMeters()
        return numMeters / 1000
    }
    var meters: Double {

        let numMeters = convertToMeters()
        return numMeters / 1.0
    }
    var centimeters: Double {
        let numMeters = convertToMeters()
        return numMeters * 100
    }
    
    var unitTypes: [String] = ["miles", "yards", "feet", "kilometers", "meters", "centimenters" ]
    
    // This will be used to help me figure out how many meters are in 1 unit of each measuring device. This will be used to help convert anything to meters, so that we can quickly convert to everything else
    var metersPerUnits: [String: Double] = ["miles": 1609.344, "yards": 0.9144, "feet": 0.3048, "kilometers":1000, "meters":1.0, "centimenters":0.01]
    
    
    func convertToMeters() -> Double
    {
        let amount = Double(originalAmount) ?? 0.0
        let unitType = unitTypes[originalUnit]
        let metersPer = metersPerUnits[unitType] ?? 1.0
        return amount * metersPer
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $originalAmount)
                    .keyboardType(.decimalPad)
                    Picker("Units", selection: $originalUnit) {
                        ForEach (0..<unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                }
                Section(header: Text("Conversions")) {
                    Text("\(miles, specifier: "%.4f") miles")
                    Text("\(yards, specifier: "%.4f") yards")
                    Text("\(feet, specifier: "%.4f") feet")
                    Text("\(kilometers, specifier: "%.4f") kilometers")
                    Text("\(meters, specifier: "%.4f") meters")
                    Text("\(centimeters, specifier: "%.4f") centimeters")
                }
            }
            .navigationBarTitle("Length Converter")
        }
    
    }
}

struct LengthConverter_Previews: PreviewProvider {
    static var previews: some View {
        LengthConverter()
    }
}
