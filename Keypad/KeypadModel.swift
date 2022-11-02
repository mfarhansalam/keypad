//
//  KeypadModel.swift
//  Keypad
//
//  Created by Farhan Salam on 25/10/2022.
//

import Foundation
import SwiftUI

enum KeypadButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case backspace, clear, enter, shift, space
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    case questionMark, excMark, percent, openBrack, closeBrack, money, plus, minus,atSign
    
    var letters: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two : return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .questionMark: return "?"
        case .excMark: return "!"
        case .percent: return "%"
        case .openBrack: return "("
        case .closeBrack: return ")"
        case .money: return "$"
        case .plus: return "+"
        case .minus: return "-"
        case .atSign: return "@"
            
        case .backspace: return "delete.left.fill"
        case .clear: return "trash.fill"
        case .enter: return "arrow.turn.down.left"
        case .shift: return "caps"
        case .space: return " "
        
        case .a: return "a"
        case .b: return "b"
        case .c: return "c"
        case .d: return "d"
        case .e: return "e"
        case .f: return "f"
        case .g: return "g"
        case .h: return "h"
        case .i: return "i"
        case .j: return "j"
        case .k: return "k"
        case .l: return "l"
        case .m: return "m"
        case .n: return "n"
        case .o: return "o"
        case .p: return "p"
        case .q: return "q"
        case .r: return "r"
        case .s: return "s"
        case .t: return "t"
        case .u: return "u"
        case .v: return "v"
        case .w: return "w"
        case .x: return "x"
        case .y: return "y"
        case .z: return "z"
            
        default:
            return "."
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.gray)
        default:
            return .green
        }
    }
    
    var fontColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.white)
        default:
            return .white
        }
    }
}
