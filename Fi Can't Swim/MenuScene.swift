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
    let fi = SKSpriteNode(imageNamed: characterSkins[currFiIndex])
    var showAnimation = true
    let height = deviceWidth * 0.75
    let width = deviceWidth * 0.75
    var size1 = CGSize()
    var size2 = CGSize()
    var size3 = CGSize()
    
    override func didMove(to view: SKView) {
        
        size1 = CGSize(width: width/3, height: height/3)
        size2 = CGSize(width: width/2, height: height/2)
        size3 = CGSize(width: width, height: height)
        
        loadGameData()
        setScene()
        setFiInScene()
        
    }
    
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func setFiInScene() {
        
        if showAnimation {
            showBeginningAnimation()
        }
        else {
            //Just set fi in position
            fi.size = size3
            fi.position = centerScreen
            fi.zPosition = characterZPosition
            addChild(fi)
        }
    }
    
    func showBeginningAnimation() {
        
        fi.zPosition = characterZPosition
        addChild(fi)
        let duration = 1.0
        let actionA = SKAction.run {
            //fi rolls right, size1
            self.fi.size = self.size1
            self.fi.position = CGPoint(x: 0.0 - self.fi.size.width * 1.1, y: deviceHeight * 0.8)
            self.fi.run(SKAction.move(to: CGPoint(x: deviceWidth * 1.2, y: self.fi.position.y), duration: duration))
            self.fi.run(SKAction.rotate(byAngle: CGFloat(-360.degreesToRadians), duration: duration))
        }
        
        let actionB = SKAction.run {
            //fi rolls left, size2
            self.fi.size = self.size2
            self.fi.position = CGPoint(x: deviceWidth * 1.2, y: deviceHeight * 0.65)
            self.fi.run(SKAction.move(to: CGPoint(x: 0.0 - deviceWidth * 1.2, y: self.fi.position.y), duration: duration))
            self.fi.run(SKAction.rotate(byAngle: CGFloat(360.degreesToRadians), duration: duration))
        }
        
        let actionC = SKAction.run {
            //fi rolls right and stops, size3
            self.fi.size = self.size3
            self.fi.zRotation = -(CGFloat)(180.degreesToRadians)
            self.fi.position = CGPoint(x: self.fi.position.x, y: centerY)
            self.fi.run(SKAction.move(to: centerScreen, duration: duration))
            self.fi.run(SKAction.rotate(byAngle: CGFloat(-180.degreesToRadians), duration: duration))

        }
        let delay = SKAction.wait(forDuration: duration * 1.2)
        fi.run(SKAction.sequence([actionA, delay, actionB, delay, actionC]))
    }
    
    func setScene(){
        
        playSound()

        let bg = SKSpriteNode(imageNamed: "Sky.png")
        bg.size = CGSize(width: deviceWidth, height: deviceHeight)
        bg.position = centerScreen
        bg.zPosition = 1
        addChild(bg)
        
        label.position = CGPoint(x: TitlePosition.x, y: TitlePosition.y)
        addChild(label)
        
        settingsButton.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.35)
        settingsButton.zPosition = characterZPosition + 1
        addChild(settingsButton)
        
        playButton.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.43)
        playButton.zPosition = characterZPosition + 1
        addChild(playButton)
        
        loadBackground()
    }
    
    func loadBackground() {
        
        let water = SKSpriteNode(imageNamed: "water.png")
        water.size = CGSize(width: deviceWidth * 2, height: deviceHeight / 5)
        water.position = CGPoint(x: centerX, y: 0.0 + water.size.height/2)
        water.zPosition = 2
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
