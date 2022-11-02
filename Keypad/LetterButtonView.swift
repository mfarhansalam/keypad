//
//  LetterButtonView.swift
//  Keypad
//
//  Created by Farhan Salam on 25/10/2022.
//

import SwiftUI

struct LetterButtonView: View {
    @ObservedObject var kvm = ViewModel()
    var letter : KeypadButton
    var geo: GeometryProxy
    var rowButtonCount: Int
    
    var body: some View {
        if letter == .backspace
            || letter == .clear
            || letter == .enter
            || letter == .shift
        {
            Button(action: {
                if letter == .shift {
                    kvm.toggleShift()
                } else {
                    kvm.addText(button: letter)
                }
            }) {
                Image(systemName: (letter.letters))
                    .font(.system(size: 25))
                    .frame(width: 36, height: 55)
                    .foregroundColor(letter.fontColor)
                    .background(letter.backgroundColor)
                    .cornerRadius(8)
            }.padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
        } else {
            Button(action: {
                kvm.addText(button: letter)
            }) {
                Text(kvm.caplocks ? letter.letters.uppercased() : letter.letters)
                    .font(.system(size: 25))
                    .frame(width: buttonWidth(button: letter),
                           height: buttonHeight(button: letter))
                    .frame(width: 36, height: 55)
                    .foregroundColor(letter.fontColor)
                    .background(letter.backgroundColor)
                    .cornerRadius(8)
            }.padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
        }
    }
    
    private func buttonWidth(button: KeypadButton) -> CGFloat {
        if button == .space {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 4
        } else if button == .zero {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 2
        } else {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1)
        }
    }
    
    private func buttonHeight(button: KeypadButton) -> CGFloat {
        if button == .enter {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 2
        } else {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1)
        }
    }
}


