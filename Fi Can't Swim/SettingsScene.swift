//
//  MapScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class SettingsScene : SKScene {
    
    let title = Label(label: "Settings", fontColor: .red, fontSize: 30.0)
    let leftArrow = SKSpriteNode(imageNamed: "leftArrow.png")
    let rightArrow = SKSpriteNode(imageNamed: "rightArrow.png")
    let backButton = BackButton()
    let FiSize = CGSize(width: deviceWidth * 0.5, height: deviceWidth * 0.5)
    var thisSize = CGSize()
    
    let selectableFis: [Character] = [fi1,fi2,fi3,fi4,fi5,fi6]
    var prevIndex = 0
    var nextIndex = 0
    
    var centerPoint: CGPoint = CGPoint(x: centerX, y: deviceHeight * 0.30)
    var prevPoint = CGPoint()
    var nextPoint = CGPoint()
    var farRightPoint = CGPoint()
    var farLeftPoint = CGPoint()
    var prevFi = SKSpriteNode()
    var nextFi = SKSpriteNode()
    var centerFi = SKSpriteNode()
    let centerPrice = SKLabelNode()
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("curr fi index: \(currFiIndex)")
        
        thisSize = CGSize(width: FiSize.width * 0.5, height: FiSize.height * 0.5)
        centerPoint = CGPoint(x: centerX, y: deviceHeight * 0.30)
        prevPoint = CGPoint(x: centerPoint.x - FiSize.width * 1.2, y: (centerPoint.y))
        nextPoint = CGPoint(x: centerPoint.x + FiSize.width * 1.2, y: (centerPoint.y))
        farLeftPoint = CGPoint(x: deviceWidth * 1.25, y: centerPoint.y)
        farRightPoint = CGPoint(x: 0.0 - deviceWidth * 0.25, y: centerPoint.y)
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        addFiSelector()
        addButtons()
        
        backgroundColor = .white
        title.position = TitlePosition
        title.zPosition = 10
        self.addChild(title)
        
    }
    override func willMove(from view: SKView) {
        self.removeAllChildren()
    }
    //get indexes for prev and next characters
    func getIndexes() {
        
        if currFiIndex == -1 {
            currFiIndex = characterArray.count - 1
            prevIndex = currFiIndex - 1
            nextIndex = 0
        }
        else if currFiIndex == characterArray.count {
            currFiIndex = 0
            prevIndex = characterArray.count - 1
            nextIndex = currFiIndex + 1
        }
        else if currFiIndex == characterArray.count - 1 {
            nextIndex = 0
            prevIndex = currFiIndex - 1
        }
        else if currFiIndex == 0 {
            nextIndex = currFiIndex + 1
            prevIndex = characterArray.count - 1
        }
        else {
            nextIndex = currFiIndex + 1
            prevIndex = currFiIndex - 1
        }
        print("prev fi index: \(prevIndex)")
        print("curr fi index: \(currFiIndex)")
        print("next fi index: \(nextIndex)")
        print("_______________________")
        currFi = characterArray[currFiIndex]
    }
    
    func addFiSelector(){
        //get corrected indexes
        getIndexes()
        
        //2 remove characters
        self.removeChildren(in: [centerFi, prevFi, nextFi, centerPrice])
        //centerFi.removeFromParent()
        //prevFi.removeFromParent()
        //nextFi.removeFromParent()
        
        //reset characters
        centerFi.texture = SKTexture(imageNamed: characterSkins[currFiIndex])
        centerFi.size = FiSize
        centerFi.position = centerPoint
        addChild(centerFi)
        
        centerPrice.text = String("\(currFi.price)")
        centerPrice.fontSize = 24.0
        centerPrice.fontColor = .red
        centerPrice.position = CGPoint(x: centerPoint.x, y: centerPoint.y - FiSize.height * 0.75)
        addChild(centerPrice)
        
        //size for prev and next characters, smaller than center fi
        
        
        prevFi.texture = SKTexture(imageNamed: characterSkins[prevIndex])
        nextFi.texture = SKTexture(imageNamed: characterSkins[nextIndex])
        prevFi.size = FiSize
        nextFi.size = FiSize
        prevFi.position = prevPoint
        nextFi.position = nextPoint
        prevFi.zPosition = (centerFi.zPosition) + 1
        nextFi.zPosition = (centerFi.zPosition) + 1
        addChild(prevFi)
        addChild(nextFi)
    }
    
    func addButtons() {
        let arrowSize = CGSize(width: 50.0, height: 50.0)
        leftArrow.position = CGPoint(x: deviceWidth * 0.25, y: (centerFi.position.y) - FiSize.width/2)
        rightArrow.position = CGPoint(x: deviceWidth * 0.75, y: (centerFi.position.y) - FiSize.width/2)
        leftArrow.size = arrowSize
        rightArrow.size = arrowSize
        addChild(leftArrow)
        addChild(rightArrow)
        
        backButton.position = BackButtonPosition
        self.addChild(backButton)
    }
    
    func cycleCharacters(cycleRight: Bool) {
        //cycle characters left
        if !cycleRight {
            moveCharactersLeft()
            currFiIndex -= 1
        }
        //cycle characters right
        if cycleRight {
            moveCharactersRight()
            currFiIndex += 1
        }
        playButtonSound()
        //getIndexes()
        addFiSelector()
    }
    func moveCharactersRight(){
        nextFi.run(SKAction.move(to: farRightPoint, duration: 0.5))
        centerFi.run(SKAction.move(to: nextPoint, duration: 0.5))
        prevFi.run(SKAction.move(to: centerPoint, duration: 0.5))
    }
    func moveCharactersLeft(){
        nextFi.run(SKAction.move(to: centerPoint, duration: 0.5))
        centerFi.run(SKAction.move(to: prevPoint, duration: 0.5))
        prevFi.run(SKAction.move(to: farLeftPoint, duration: 0.5))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        leftArrow.alpha = 1.0
        rightArrow.alpha = 1.0
        centerFi.alpha = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if leftArrow.contains(location) {
                leftArrow.alpha = 0.5
                centerFi.alpha = 0.4
                cycleCharacters(cycleRight: false)
            }
            if rightArrow.contains(location){
                rightArrow.alpha = 0.5
                centerFi.alpha = 0.4
                cycleCharacters(cycleRight: true)
            }
            
            if backButton.contains(location){
                //save new currFi to gameData
                
                //go to game scene
                sceneTransition(initScene: self, nextScene: MenuScene())
            }
            
        }
    }

    
}
