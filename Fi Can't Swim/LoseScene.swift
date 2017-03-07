//
//  LoseScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/2/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class LoseScene : SKScene {
    
    let title = Label(label: "#Fi Can't Swim", fontSize: 30.0)
    let playAgain = Label(label: "Play Again", fontSize: 20.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        
        backgroundColor = custBlue
        title.position = centerScreen
        addChild(title)
        
        playAgain.position = CGPoint(x: centerX, y: centerY - title.fontSize * 1.25)
        addChild(playAgain)
        
        addFish()
        dropFi()
    }
    
    func dropFi() {
        
        let fi = Character(texture: SKTexture(imageNamed: characterSkins[currFiIndex]))
        fi.position = CGPoint(x: centerX, y: deviceHeight * 1.25)
        addChild(fi)
    }
    
    func addFish() {
        let fish = SKSpriteNode(imageNamed: "fish1.png")
        fish.zPosition = characterZPosition + 1
        fish.position = CGPoint(x: deviceWidth * 1.2, y: centerY)
        addChild(fish)
        fish.run(SKAction.move(to: CGPoint(x: -150.0,y: centerY), duration: 4.0))
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

