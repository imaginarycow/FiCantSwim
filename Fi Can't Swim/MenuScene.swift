//
//  MenuScene.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    let label = Label(label: "Fi Can't Swim", fontColor: fiColor, fontSize: 40.0)
    let settingsButton = Label(label: "Settings", fontColor: .white, fontSize: 30.0)
    let playButton = Label(label: "Play", fontColor: .white, fontSize: 30.0)
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        label.position = CGPoint(x: TitlePosition.x, y: TitlePosition.y)
        addChild(label)
        
        settingsButton.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.4)
        addChild(settingsButton)
        playButton.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.5)
        addChild(playButton)
        
        loadBackground()
    }
    
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func loadBackground() {
        
        let height = deviceHeight * 0.7
        let width = deviceHeight / ratio
        let fi = SKSpriteNode(imageNamed: "Fi_Character.png")
        addChild(fi)
        fi.position = CGPoint(x: centerX, y: centerY)
        fi.size = CGSize(width: width, height: height)
        
        let water = SKSpriteNode(imageNamed: "water.png")
        water.size = CGSize(width: deviceWidth * 2, height: deviceHeight / 5)
        water.position = CGPoint(x: centerX, y: 0.0 + water.size.height/2)
        addChild(water)
        
        water.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0)])))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if playButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
            if settingsButton.contains(location){
                //go to map scene
                sceneTransition(initScene: self, nextScene: SettingsScene())
            }
        }
    }
    
    
}
