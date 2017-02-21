//
//  MapScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class MapScene : SKScene {
    
    let title = Label(label: "Map", fontColor: .red, fontSize: 30.0)
    let backButton = BackButton()
    var levelIcons: [LevelIcon] = []
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        deviceWidth = Int(self.view!.bounds.size.width)
        backgroundColor = .white
        title.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.9)
        title.zPosition = 10
        self.addChild(title)
        
        backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(backButton)
        
        showLevels()
        
    }
    override func willMove(from view: SKView) {
        self.removeAllChildren()
    }
    func showLevels(){
        buildLevels(numberOfLevels: NumberOfLevels)
        let buffer = CGFloat(10.0)
        var count:CGFloat = 1
        var row = 1
        for icon in levelIcons {
                
            icon.position = CGPoint(x: 0.0 + icon.size.width * count + buffer, y: (self.view?.bounds.height)! * 0.8 - row * icon.size.height * 2)
            self.addChild(icon)
                    
            count += 1
            if count = 6{
                count = 1
                row += 1
            }
        }
    
       connectLevels()     
    }
    
    func connectLevels(){
        
    }
    func buildLevels(numberOfLevels: Int){
        var index = 1
        for _ in 1...numberOfLevels {
            let levelIcon = LevelIcon(levelNum: index)
            levelIcons.append(levelIcon)
            index += 1
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MenuScene())
            }
            
        }
    }
    
    
}
