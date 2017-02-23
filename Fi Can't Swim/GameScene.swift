//
//  GameScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class GameScene : SKScene {
    
    let title = Label(label: "Game", fontSize: 30.0)
    let levelLabel = Label(label: "Level \(currLevel)", fontSize: 10.0)
    let scoreLabel = Label(label: "Score Label", fontSize: 15.0)
    let backButton = BackButton()
    let water = SKSpriteNode(imageNamed: "water.png")
    
    let nextSceneButton = Label(label: "Next Level Please", fontSize: 50.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .white
        buildLabels()
        
        loadLevel(level: currLevel, parent: self)
        loadWater()
        
        //nextSceneButton.position = centerScreen
        //addChild(nextSceneButton)
        
    }
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    func buildLabels(){
        
        title.position = TitlePosition
        self.addChild(title)
        
        levelLabel.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(levelLabel)
        
        scoreLabel.position = CGPoint(x: (self.view?.bounds.width)! * 0.9, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(scoreLabel)
        
        backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(backButton)

    }
    func updateScore(){
        //save level score
        
    }
    func beatLevel(){
        
        //count points 
        currLevel += 1
        if currLevel > NumberOfLevels {
            //player beat game
            sceneTransition(initScene: self, nextScene: WinScene())
        }
        else {
            sceneTransition(initScene: self, nextScene: GameScene())
        }
        
    }
    
    func loadWater(){
        //let water = SKSpriteNode(imageNamed: "water.png")
        water.size = CGSize(width: deviceWidth * 2, height: deviceHeight / 5)
        water.position = CGPoint(x: centerX, y: 0.0 + water.size.height/2)
        addChild(water)
        
        moveWater()
    }
    func moveWater(){
        water.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0)])))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if nextSceneButton.contains(location){
                beatLevel()
            }
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
        }
    }

    
}
