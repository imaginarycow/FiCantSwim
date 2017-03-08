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
var buttonPlayer: AVAudioPlayer?
var effectPlayer: AVAudioPlayer?
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

func playButtonSound() {
    let url = Bundle.main.url(forResource: "buttonPush", withExtension: "mp3")!
    
    do {
        print("launching new avaudio player")
        buttonPlayer = try AVAudioPlayer(contentsOf: url)
        guard let buttonPlayer = buttonPlayer else { return }
        
        buttonPlayer.prepareToPlay()
        buttonPlayer.play()
        buttonPlayer.numberOfLoops = 0
        //playerPlaying = true
    } catch let error {
        print(error.localizedDescription)
    }
}
func playSplashSound() {
    let url = Bundle.main.url(forResource: "splash", withExtension: "mp3")!
    
    do {
        print("launching new avaudio player")
        effectPlayer = try AVAudioPlayer(contentsOf: url)
        guard let effectPlayer = effectPlayer else { return }
        
        effectPlayer.prepareToPlay()
        effectPlayer.play()
        effectPlayer.numberOfLoops = 0
        //playerPlaying = true
    } catch let error {
        print(error.localizedDescription)
    }
}



