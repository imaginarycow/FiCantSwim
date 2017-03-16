//
//  Coin.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/2/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let coinSize:CGSize = CGSize(width: 40.0 * scale, height: 40.0 * scale)
var coins: [Coin] = []

class Coin : SKSpriteNode {
    
    var value: Int!
    var grabbed = false
    
    init(value: Int, texture: SKTexture? = SKTexture(imageNamed: "coin.png"), color: UIColor = .clear, size: CGSize = coinSize) {
        super.init(texture: texture, color: color, size: size)
        self.value = value
        self.physicsBody = SKPhysicsBody(circleOfRadius: coinSize.width/2)
        self.zPosition = coinZPosition
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = coinCategory
        self.physicsBody?.contactTestBitMask = fiCategory
        addLabel(value: value)
        
    }
    
    func addLabel(value: Int){
        let label = SKLabelNode(text: "\(value)")
        label.zPosition = coinZPosition + 1
        label.fontSize = coinSize.width * 0.5
        label.fontName = defaultFont
        label.fontColor = custBlue
        label.position = CGPoint(x: 0.0, y: 0.0 - label.fontSize/2)
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
