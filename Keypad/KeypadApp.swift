//
//  KeypadApp.swift
//  Keypad
//
//  Created by Farhan Salam on 25/10/2022.
//

import SwiftUI

@main
struct KeypadApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
