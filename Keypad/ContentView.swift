//
//  ContentView.swift
//  Keypad
//
//  Created by Farhan Salam on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var kvm = ViewModel()
    var body: some View {
        VStack {
            HStack{
                Text(kvm.label).foregroundColor(.black)
                    .font(.system(size: 25))
                    .frame(width: UIScreen.main.bounds.width / 2, height: 32)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 2)
                        .stroke(Color.gray, lineWidth: 2))
            }
            Spacer()
            GeometryReader{ geometry in
//                gfghf
                HStack (spacing: 1){
                    
                    VStack (spacing: 0) {
                        ForEach(kvm.rows, id: \.self) {row in
                            HStack (spacing: 1) {
                                ForEach(row, id: \.self) {button in
                                    Button(action: {
                                        if button == .shift {
                                            kvm.toggleShift()
                                        } else if button == .clear{
                                        
                                            kvm.clearText()
                                        }else if button == .backspace {
                                            kvm.backspace()
                                        }
                                        else {
                                            kvm.addText(button: button)
                                        }
                                    }) {
                                        Text(kvm.caplocks ? button.letters.uppercased() : button.letters)
//                                        Image(systemName: (kvm.caplocks ? button.letters.uppercased() : button.letters))
                                            .font(.system(size:28))
                                            .frame(width: buttonWidth(button: button, geo: geometry, rowButtonCount: kvm.rows[0].count),
                                            height: buttonHeight(button: button, geo: geometry, rowButtonCount: kvm.rows[0].count))
                                            .foregroundColor(button.fontColor)
                                            .background(button.backgroundColor)
                                            .cornerRadius(8)
                                    }.padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
                                }
                            }
                        }
                    }
                    
                }.padding(.bottom)
            }
            
        }

    
}
    private func buttonWidth(button: KeypadButton, geo: GeometryProxy, rowButtonCount: Int) -> CGFloat {
        if button == .space {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 4
        } else if button == .zero {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 2
        } else {
            return geo.size.width / CGFloat(rowButtonCount + 1)
        }
    }
    
    private func buttonHeight(button: KeypadButton, geo: GeometryProxy, rowButtonCount: Int) -> CGFloat {
        if button == .enter {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1) * 2
        } else {
            return (geo.size.width - CGFloat(rowButtonCount - 2)) / CGFloat(rowButtonCount + 1)
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
