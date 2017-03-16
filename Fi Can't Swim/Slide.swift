//
//  Slide.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let maxSlideLife = 3

class Slide: SKShapeNode {
    
    var active = false
    var counter = 0
    
    init(name: String, path: CGPath) {
        super.init()
        self.path = path
        self.lineWidth = 8
        self.lineCap = .round
        self.strokeColor = randomColor()
        self.zPosition = slideZPosition
        self.name = name
        self.physicsBody?.mass = 1.0
        self.physicsBody = SKPhysicsBody(edgeChainFrom: path)
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = slideCategory
        self.physicsBody?.collisionBitMask = fiCategory

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
