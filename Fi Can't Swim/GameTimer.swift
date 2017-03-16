//
//  Timer.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/12/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    
    func runTimedCode() {
        
        //count up for each slide in slides array
        for slide in slides {
            slide.counter += 1
            slide.alpha -= 0.25
            
            //check if slide has lived its life
            if slide.counter > maxSlideLife {
                slides.removeFirst()
                slide.removeFromParent()
            }
        }
        
        
        //check if fi is still touching the flag after 2 seconds
        //start the win counter
        if flagTouched {
            seconds += 1
        }
        //reset the counter if fi stops touching the flag
        else {
            seconds = 0
        }
        //call beatLevel, you won!
        if seconds >= 2{
            beatLevel(beat: true)
        }
    }
}


