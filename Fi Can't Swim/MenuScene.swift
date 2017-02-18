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
    
    let label = Label(label: "Fi Can't Swim", fontColor: .green, fontSize: 20.0)
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .yellow
        label.position = CGPoint(x: (self.view?.bounds.width)!/2, y: (self.view?.bounds.height)! * 0.9)
        addChild(label)
        
    }
    
    
}
