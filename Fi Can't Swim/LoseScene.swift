//
//  LoseScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/2/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class LoseScene : SKScene {
    
    let title = Label(label: "#Loser", fontSize: 30.0)
    let playAgain = Label(label: "Play Again", fontSize: 20.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .yellow
        title.position = centerScreen
        addChild(title)
        
        playAgain.position = CGPoint(x: centerX, y: centerY - title.fontSize * 2)
        addChild(playAgain)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            if playAgain.contains(location){
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
            
        }
    }
    
    
}

