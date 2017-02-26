//
//  Label.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

//var defaultFont = "CourierNewPS-BoldMT"
var defaultFont = "Noteworthy-Bold"

class Label : SKLabelNode {
    
    init(label:String, fontColor:UIColor = fiColor, fontSize: CGFloat, fontName: String = defaultFont) {
        super.init()
        self.text = label
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.fontName = fontName
        self.zPosition = 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

