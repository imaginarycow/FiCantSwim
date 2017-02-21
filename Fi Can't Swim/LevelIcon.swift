//
//  Level.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let iconSize:CGSize = CGSize(width: 30.0, height: 30.0)

class LevelIcon: SKSpriteNode {

    var lvlNum:Int = 0
    var score:Int = 0
    
    
    init(levelNum: Int, texture: SKTexture? = SKTexture(imageNamed: "Level_Icon.png"), color: UIColor = .white, size: CGSize = iconSize) {
        super.init(texture: texture, color: color, size: size)
        self.lvlNum = levelNum
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
