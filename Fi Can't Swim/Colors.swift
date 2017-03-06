//
//  Colors.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/2/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let fiColor: UIColor = UIColor(colorLiteralRed: 247/255, green: 82/255, blue: 82/255, alpha: 1.0)
let custPurple = UIColor(colorLiteralRed: 135/255, green: 0/255, blue: 131/255, alpha: 1.0)
let custYellow = UIColor(colorLiteralRed: 255/255, green: 253/255, blue: 196/255, alpha: 1.0)
let custBlue = UIColor(colorLiteralRed: 0/255, green: 118/255, blue: 163/255, alpha: 1.0)

func randomColor() -> UIColor {
    let colors: [UIColor] = [.red, .green, .blue, .magenta, .brown, .black, .yellow, .purple, .gray, .cyan, .orange]
    
    return colors[Int(arc4random_uniform(UInt32(colors.count)))]
}
