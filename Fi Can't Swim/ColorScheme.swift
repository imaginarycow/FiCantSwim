//
//  ColorScheme.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/12/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class ColorScheme {
    
    var background: String!
    var primaryColor: UIColor!
    var secondaryColor: UIColor!
    var buttonColor: UIColor!
    var labelColor: UIColor!
    
    init(bg: String, primColor: UIColor, secColor: UIColor, buttColor: UIColor, labelColor: UIColor) {
        self.background = bg
        self.primaryColor = primColor
        self.secondaryColor = secColor
        self.buttonColor = buttColor
        self.labelColor = labelColor
    }
    
}
