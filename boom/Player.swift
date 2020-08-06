//
//  Player.swift
//  boom
//
//  Created by Pavel Zaitsev on 7/13/20.
//  Copyright © 2020 Pavel Zaitsev. All rights reserved.
//

import Foundation
import AVFoundation
import Combine


class Player: ObservableObject {

    var sound: AVAudioPlayer!
    let willChange = PassthroughSubject<Player, Never>()

     var isPlaying: Bool = false {
         willSet {
             willChange.send(self)
         }
     }
    func playSound() {
        if !isPlaying {
        if let path = Bundle.main.path(forResource: "boom", ofType: "mp3") {
            do {
                isPlaying = true
                sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                print("Playing sound")
                sound.play()
                isPlaying = false
            } catch {
                print( "Could not find file")
            }
        }
        }
    }
}
