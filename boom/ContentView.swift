//
//  ContentView.swift
//  boom
//
//  Created by Pavel Zaitsev on 7/13/20.
//  Copyright © 2020 Pavel Zaitsev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var player: Player
    @State var buttonPow: String = "🔫"
    var body: some View {
        VStack {
            
            Button(action: {
                DispatchQueue.main.async {
                    self.player.playSound()
                }
                self.buttonPow = "🎈"

                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                    self.buttonPow = "🔫"
                }
                print("HEY")
               
            }) {
                Text(buttonPow)
                    .fontWeight(.bold)
                    .font(.system(size: 90))
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let player = Player()
    static var previews: some View {
        ContentView().environmentObject(player)
    }
}
