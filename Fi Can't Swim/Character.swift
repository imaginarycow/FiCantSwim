//
//  Character.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class Character :  GameObject{
    
    var isMoving: Bool = false
    
    
    override init(type: ObjectType = .character, texture: SKTexture? = SKTexture(image: #imageLiteral(resourceName: "Fi_Body.png")), color: UIColor = .white, size: CGSize = characterSize, isDynamic: Bool = true) {
        super.init(type: type, texture: texture, size: size)
        self.zPosition = 2
        self.physicsBody?.restitution = 0.5
        
    }
    
    func checkForMovement() -> Bool{
        return self.isMoving
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
