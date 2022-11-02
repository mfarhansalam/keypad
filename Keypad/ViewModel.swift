//
//  ViewModel.swift
//  Keypad
//
//  Created by Farhan Salam on 25/10/2022.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var label = ""
    @Published var caplocks = false
    
    let rows: [[KeypadButton]] = [
        [.q, .w, .e, .r, .t, .y, .u, .i, .o, .p, .one, .two, .three],
        [.a, .s, .d, .f, .g, .h, .j, .k, .l, .atSign, .four, .five, .six],
        [.shift, .z, .x, .c, .v, .b, .n, .m, .openBrack, .closeBrack, .seven, .eight, .nine],
        [.backspace, .clear, .money, .space, .plus, .minus, .percent, .decimal, .zero]
    ]
    
    
    func addText(button : KeypadButton){
        if caplocks {
            label.append(contentsOf: button.letters.uppercased())
        } else {
            label.append(button.letters)
        }
    }
    func toggleShift() {
        caplocks.toggle()
    }
    
    func clearText() {
        label = ""
    }
    
    func backspace(){
        label.removeLast()
    }
}
