//
//  Game_Object.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let characterSize = CGSize(width: 60.0, height: 60.0)
let landingSize: CGSize = CGSize(width: 70.0, height: 20.0)

class GameObject: SKSpriteNode {
    
    convenience init() {
        self.init(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: CGSize(width: 10.0, height: 10.0))
    }
    
    init(type: ObjectType = .unknown, texture: SKTexture?, color: UIColor = .white, size: CGSize, isDynamic:Bool = false) {
        super.init(texture: texture, color: color, size: size)
        
        if type == .character{
            self.physicsBody = SKPhysicsBody(circleOfRadius: characterSize.width * 0.5)

        }
        else {
            self.physicsBody = SKPhysicsBody(texture: texture!, size: size)
            self.physicsBody?.affectedByGravity = false
            self.physicsBody?.isDynamic = isDynamic
            self.zPosition = 2
        }
        //self.physicsBody?.isDynamic = isDynamic
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
enum ObjectType {
    case character, platform, coin, life, unknown
}
