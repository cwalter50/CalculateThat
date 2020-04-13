//
//  QuadView.swift
//  CalculateThat
//
//  Created by Christopher Walter on 4/12/20.
//  Copyright © 2020 Christopher Walter. All rights reserved.
//

import SwiftUI
import Combine


struct QuadView : View {

    @State private var valA: String = ""
    @State private var valB: String = ""
    @State private var valC: String = ""
    @State private var solution: String = ""

    var body: some View
    {
        NavigationView {
            Form {
                Section(header: Text("Your Info")) {
                    HStack {
                        TextField("ValueA", text: $valA)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("ValueB", text: $valB)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("ValueC", text: $valC)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Section {
                        Button(action: {
                    
                            self.calculate()
                        }) {
                            Text("Calculate")
                                .multilineTextAlignment(.center)
                        }
                        .multilineTextAlignment(.center)
                    }
                    Section(header: Text("Solution")) {
                        MultilineTextView(text: $solution)
//                        TextField("Solution", text: $solution)
//                            .multilineTextAlignment(.center)
                    }
                    
                }
            }
                
           
        .navigationBarTitle("Quad Calculator")
            
        }
       
    }
    
    func calculate()
    {
        // safely check if a, b and c and valid numbers
        guard let a = Double(valA), let b = Double(valB), let c = Double(valC) else {
            solution = "a, b, and c must be valid numbers"
            return
        }
        // get the determinant to figure out how many solutions there are...
        let determinant = pow(b, 2.0) - 4 * a * c
        
        if determinant > 0 // 2 solutions
        {
            let solution1 = (-1 * b + sqrt(determinant)) / (2 * a)
            let solution2 = (-1 * b - sqrt(determinant)) / (2 * a)
            
            // round to nearest hundredth
            let sol1Rounded = String(format: "%.02f ", solution1)
            let sol2Rounded = String(format: "%.02f ", solution2)
            
            solution = "Two solutions: \(sol1Rounded) and \(sol2Rounded)"
        }
        else if determinant == 0 // 1 solution
        {
            let solution1 = (-1 * b - sqrt(determinant)) / (2 * a)
            let sol1Rounded = String(format: "%.02f ", solution1)
            
            solution = "One solution: \(sol1Rounded)"
        }
        else //  no solutions or non real solutions...
        {
            solution = "No Solution"
        }

    }
    
    struct MultilineTextView: UIViewRepresentable {
        @Binding var text: String

        func makeUIView(context: Context) -> UITextView {
            let view = UITextView()
            view.isScrollEnabled = true
            view.isEditable = true
            view.isUserInteractionEnabled = true
            return view
        }

        func updateUIView(_ uiView: UITextView, context: Context) {
            uiView.text = text
        }
    }
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Your Info")){
//                    TextField("Name", text: $name)
//                    TextField("email", text: $email)
//                }
//                Section(header: Text("Password")) {
//                    TextField("password", text: $password)
//                }
//                Section {
//                    Button(action: {
//                        print("register now")
//                    }) {
//                        Text("OK")
//                    }
//                }
//            }
//            .navigationBarTitle("Registration Form")
//        }
//
//
//
//    }
}




struct QuadView_Previews: PreviewProvider {
    static var previews: some View {
        QuadView()
    }
}
