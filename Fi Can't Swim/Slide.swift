//
//  Slide.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class Slide: SKShapeNode {
    
    var active = false
    
    init(name: String, path: CGPath) {
        super.init()
        self.path = path
        self.lineWidth = 8
        self.lineCap = .round
        self.strokeColor = randomColor()
        self.zPosition = 5
        self.name = name
        self.physicsBody?.mass = 1.0
        self.physicsBody = SKPhysicsBody(edgeChainFrom: path)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
