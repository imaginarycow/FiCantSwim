//
//  Label.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let defaultFont = "CourierNewPS-BoldMT"

class Label : SKLabelNode {
    
    init(label:String, fontColor:UIColor, fontSize: CGFloat, fontName: String = defaultFont) {
        super.init()
        self.text = label
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.fontName = fontName
        self.zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
