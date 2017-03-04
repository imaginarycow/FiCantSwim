//
//  Character.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var currFi = #imageLiteral(resourceName: "Fi_Body.png")
let characterSize = CGSize(width: 60.0, height: 60.0)

class Character :  GameObject{
    
    var isMoving: Bool = false
    var waypoints: [CGPoint] = []
    
    
    override init(type: ObjectType = .character, texture: SKTexture? = SKTexture(image: currFi), color: UIColor = .white, size: CGSize = characterSize, isDynamic: Bool = true) {
        super.init(type: type, texture: texture, size: size)
        self.zPosition = characterZPosition
        self.physicsBody = SKPhysicsBody(circleOfRadius: characterSize.width * 0.5)
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.restitution = 0.2
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = fiCategory
        self.physicsBody?.contactTestBitMask = coinCategory | flagCategory | canonCategory
        self.physicsBody?.collisionBitMask = slideCategory | canonCategory
        
    }
    
    func checkForMovement() -> Bool{
        return self.isMoving
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
