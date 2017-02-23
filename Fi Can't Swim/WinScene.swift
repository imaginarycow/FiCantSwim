//
//  WinScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class WinScene : SKScene {
    
    let title = Label(label: "#Winning", fontSize: 30.0)
    let homeButton = Label(label: "Return to Home", fontSize: 20.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .white
        title.position = centerScreen
        addChild(title)
        
        homeButton.position = CGPoint(x: centerX, y: centerY - title.fontSize * 2)
        addChild(homeButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.location(in: self)
                
            if homeButton.contains(location){
                sceneTransition(initScene: self, nextScene: MenuScene())
            }
                
            
        }
    }
    
    
}
