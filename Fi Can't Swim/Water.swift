//
//  Water.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/26/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let waterSize = CGSize(width: deviceWidth * 2, height: deviceHeight / 5)

class Water : SKSpriteNode {
    
    
    override init(texture: SKTexture?, color: UIColor, size:CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.texture = SKTexture(imageNamed: "water.png")
        self.size = waterSize
        self.zPosition = 5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
