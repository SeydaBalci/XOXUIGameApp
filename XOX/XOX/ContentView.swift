//
//  ContentView.swift
//  XOX
//
//  Created by Şeyda Şeyma Balcı on 6.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endGameTitle = "XOX"
    @State private var gameEnded = false
    private var range = [(0..<3), (3..<6), (6..<9)]
    
    
    var body: some View {
            
        VStack {
          Text(endGameTitle)
                .font(.system(size: 50))
                .alert(endGameTitle, isPresented: $gameEnded) {
                    
                    Button("Baştan Başla", role: .destructive, action: resetGame)
                       
                }
            Spacer()
            
            ForEach(range, id: \.self) { range in
                HStack{
                    ForEach(range, id: \.self){
                        i in
                        OXButton(letter: $moves[i])
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded{ _ in
                                        playerClicked(index: i)
                                    }
                            )
                    }
                }
                
                
            }
            
            
            Spacer()
            
            Button(action: resetGame){
                Text("Baştan Başla")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                
            }
        }
        
        
    }
    
    func playerClicked(index:Int){
        if moves[index] == ""
        {
            moves[index] = "X"
            AIMove()
        }
        
        for letter in ["X", "O"] {
            if winnerControl(list: moves, letter: letter){
                endGameTitle = "\(letter) kazandı!"
                gameEnded = true
                break
            }
        }
        
    }
    
    func AIMove(){
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }

    }
    
    func resetGame() {
        endGameTitle = "XOX"
        moves = ["","","","","","","","",""]
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
