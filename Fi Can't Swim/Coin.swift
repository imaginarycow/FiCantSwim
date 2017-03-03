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
    
    init(value: Int, texture: SKTexture? = SKTexture(imageNamed: "coin.png"), color: UIColor = .clear, size: CGSize = coinSize) {
        super.init(texture: texture, color: color, size: size)
        addLabel(value: value)
        
    }
    
    func addLabel(value: Int){
        let label = SKLabelNode(text: "\(value)")
        label.zPosition = self.zPosition + 1
        label.fontSize = coinSize.width * 0.65
        label.fontName = defaultFont
        label.fontColor = custPurple
        label.position = CGPoint(x: 0.0, y: 0.0 - label.fontSize/2)
        self.addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
