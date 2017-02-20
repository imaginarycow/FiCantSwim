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
    let backButton = BackButton()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .white
        title.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.9)
        title.zPosition = 10
        self.addChild(title)
        
        backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(backButton)
        
    }
    override func willMove(from view: SKView) {
        self.removeAllChildren()
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
