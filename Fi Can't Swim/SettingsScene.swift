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
    let fiArray: [UIImage] = [#imageLiteral(resourceName: "Fi_Body.png"),#imageLiteral(resourceName: "Fi_Body2.png"),#imageLiteral(resourceName: "Fi_Body3.png"),#imageLiteral(resourceName: "Fi_Body4.png"),#imageLiteral(resourceName: "Fi_Body_White.png")]
    let FiSize = CGSize(width: deviceWidth * 0.5, height: deviceWidth * 0.5)
    var selectedFi = SKSpriteNode()
    var currFiIndex = 0
    var prevIndex = 3
    var nextIndex = 1
    let prevFi = SKSpriteNode()
    let nextFi = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
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
    
    func addFiSelector(){
        selectedFi.removeFromParent()
        selectedFi.texture = SKTexture(image: currFi)

        selectedFi.size = FiSize
        selectedFi.position = CGPoint(x: centerX, y: deviceHeight * 0.30)
        addChild(selectedFi)
        
        let thisSize = CGSize(width: FiSize.width * 0.5, height: FiSize.height * 0.5)
        prevFi.removeFromParent()
        nextFi.removeFromParent()
        prevFi.texture = SKTexture(image: fiArray[prevIndex])
        nextFi.texture = SKTexture(image: fiArray[nextIndex])
        prevFi.size = thisSize
        nextFi.size = thisSize
        prevFi.position = CGPoint(x: selectedFi.position.x - selectedFi.size.width, y: selectedFi.position.y)
        nextFi.position = CGPoint(x: selectedFi.position.x + selectedFi.size.width, y: selectedFi.position.y)
        prevFi.zPosition = selectedFi.zPosition + 1
        nextFi.zPosition = selectedFi.zPosition + 1
        addChild(prevFi)
        addChild(nextFi)
    }
    
    func addButtons() {
        let arrowSize = CGSize(width: 50.0, height: 50.0)
        leftArrow.position = CGPoint(x: deviceWidth * 0.25, y: selectedFi.position.y - FiSize.width/2)
        rightArrow.position = CGPoint(x: deviceWidth * 0.75, y: selectedFi.position.y - FiSize.width/2)
        leftArrow.size = arrowSize
        rightArrow.size = arrowSize
        addChild(leftArrow)
        addChild(rightArrow)
        
        backButton.position = BackButtonPosition
        self.addChild(backButton)
    }
    
    func cycleCharacters(cycleRight: Bool) {
        //cycle characters right
        if !cycleRight {
            currFiIndex += 1
            prevIndex += 1
            nextIndex += 1
            if currFiIndex == fiArray.count{
                currFiIndex = 0
            }
            if prevIndex == fiArray.count {
                prevIndex = 0
            }
            if nextIndex == fiArray.count {
                nextIndex = 0
            }
        }
        //cycle characters left
        if cycleRight {
            currFiIndex -= 1
            prevIndex -= 1
            nextIndex -= 1
            if currFiIndex < 0{
                currFiIndex = fiArray.count-1
            }
            if prevIndex < 0 {
                prevIndex = fiArray.count-1
            }
            if nextIndex < 0 {
                nextIndex = fiArray.count-1
            }
        }
        
        currFi = fiArray[currFiIndex]
        addFiSelector()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        leftArrow.alpha = 1.0
        rightArrow.alpha = 1.0
        selectedFi.alpha = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if leftArrow.contains(location) {
                leftArrow.alpha = 0.5
                selectedFi.alpha = 0.4
                cycleCharacters(cycleRight: false)
            }
            if rightArrow.contains(location){
                rightArrow.alpha = 0.5
                selectedFi.alpha = 0.4
                cycleCharacters(cycleRight: true)
            }
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MenuScene())
            }
            
        }
    }

    
}
