//
//  Character.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class Character :  SKSpriteNode{
    
    static let fi_Size = CGSize(width: 30.0,height: 30.0)
    
    override init(texture: SKTexture? = SKTexture(imageNamed: "Fi_Body.png"), color: UIColor, size: CGSize = fi_Size) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
