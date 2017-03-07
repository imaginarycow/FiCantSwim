//
//  SoundPlayer.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/5/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit
import AVFoundation

var player: AVAudioPlayer?
var playerPlaying = false

func playSound() {
    let url = Bundle.main.url(forResource: "arcade", withExtension: "mp3")!
    
    if playerPlaying {
        return
    }
    do {
        print("launching new avaudio player")
        player = try AVAudioPlayer(contentsOf: url)
        guard let player = player else { return }
        
        player.prepareToPlay()
        player.play()
        player.numberOfLoops = -1
        playerPlaying = true
    } catch let error {
        print(error.localizedDescription)
    }
}

