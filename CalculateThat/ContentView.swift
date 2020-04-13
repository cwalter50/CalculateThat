//
//  ContentView.swift
//  CalculateThat
//
//  Created by Christopher Walter on 12/17/19.
//  Copyright © 2019 Christopher Walter. All rights reserved.
//

import SwiftUI
import Combine


struct ContentView: View {
    var body: some View {
        TabView {
            LengthConverter()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("LengthConvert")
                }.tag(0)
            TipCalcView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("TipCalc")
                }.tag(1)
            QuadView()
               .tabItem {
                   Image(systemName: "3.circle")
                   Text("QuadCalc")
               }.tag(2)
        }
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





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
