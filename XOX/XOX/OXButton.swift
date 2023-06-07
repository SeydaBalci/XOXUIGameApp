//
//  OXButton.swift
//  XOX
//
//  Created by Şeyda Şeyma Balcı on 6.06.2023.
//

import SwiftUI

struct OXButton: View {
    @Binding var letter:String
    @State private var degree = 0.0
    
    
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 110,height: 110)
            Circle()
                .frame(width: 100,height: 100)
                .foregroundColor(.white)
            Text(letter)
                .font(.system(size: 70))
                .bold()
                 
        }
        .rotation3DEffect(.degrees(degree), axis: (x:0, y:1, z:0))
        .simultaneousGesture(TapGesture()
            .onEnded{ _ in
                withAnimation(.easeIn(duration: 0.3)){
                    self.degree += 180
                }
            }
        
            )
    }
}

struct OXButton_Previews: PreviewProvider {
    static var previews: some View {
        OXButton(letter: .constant("X"))
    }
}
