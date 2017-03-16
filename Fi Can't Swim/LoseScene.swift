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
    let rightGoingFish: [String] = ["fish2.png","fish3.png","fish6"]
    let leftGoingFish: [String] = ["fish1.png","fish4.png","fish5"]
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        
        backgroundColor = custBlue
        title.fontColor = currColorScheme.secondaryColor
        title.zPosition = 10
        title.position = centerScreen
        addChild(title)
        
        playAgain.position = CGPoint(x: centerX, y: centerY - title.fontSize * 1.25)
        playAgain.zPosition = 10
        playAgain.fontColor = currColorScheme.secondaryColor
        addChild(playAgain)
        
        addFish()
        dropFi()
    }
    
    func dropFi() {
        
        let fi = Character(texture: SKTexture(imageNamed: characterSkins[currFiIndex]))
        fi.position = CGPoint(x: centerX, y: deviceHeight * 1.25)
        fi.physicsBody?.mass = 0.5
        addChild(fi)
        
        //let bubbles = prepareSplash()
        //bubbles.zPosition = fi.zPosition + 1
        //fi.addChild(bubbles)
        
    }
    
    func addFish() {
        let random1: Int = Int(arc4random_uniform(UInt32(rightGoingFish.count)))
        let fish = SKSpriteNode(imageNamed: leftGoingFish[random1])
        fish.zPosition = characterZPosition + 1
        fish.position = CGPoint(x: deviceWidth * 1.2, y: deviceHeight * 0.75)
        addChild(fish)
        fish.run(SKAction.move(to: CGPoint(x: -150.0,y: deviceHeight * 0.75), duration: 4.0))
        
        let random2: Int = Int(arc4random_uniform(UInt32(leftGoingFish.count)))
        let fish2 = SKSpriteNode(imageNamed: rightGoingFish[random2])
        fish2.zPosition = characterZPosition + 1
        fish2.position = CGPoint(x: -200.0, y: deviceHeight * 0.3)
        fish2.size = CGSize(width: deviceWidth * 0.4, height: deviceWidth * 0.2)
        addChild(fish2)
        fish2.run(SKAction.move(to: CGPoint(x: deviceWidth * 1.5, y: deviceHeight * 0.3), duration: 7.0))
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

