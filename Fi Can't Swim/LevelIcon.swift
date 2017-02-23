//
//  Level.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let iconSize:CGSize = CGSize(width: 40.0 * scale, height: 40.0 * scale)

class LevelIcon: SKSpriteNode {

    var lvlNum:Int = 0
    var score:Int = 0
    var unlocked = false
    
    init(levelNum: Int, texture: SKTexture? = SKTexture(imageNamed: "Level_Icon.png"), color: UIColor = .white, size: CGSize = iconSize) {
        super.init(texture: texture, color: color, size: size)
        self.lvlNum = levelNum
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
