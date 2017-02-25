//
//  Constants.swift
//  Fi Can't Swim
//
//  Created by beltranmc on 2/17/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import Foundation
import SpriteKit

let gameData = UserDefaults()

let TitlePosition = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height * 0.92)
let BackButtonPosition = CGPoint(x: UIScreen.main.bounds.width * 0.1, y: UIScreen.main.bounds.height * 0.95)
let centerX = CGFloat(UIScreen.main.bounds.width / 2)
let centerY = CGFloat(UIScreen.main.bounds.height / 2)
let centerScreen = CGPoint(x: centerX, y: centerY)

let NumberOfLevels: Int = 35
let NumberOfIconsPerRow:CGFloat = 5
let NumberOfRows: Int = NumberOfLevels / Int(NumberOfIconsPerRow)

var score = 0
var live = 3

let fiColor: UIColor = UIColor(colorLiteralRed: 247/255, green: 82/255, blue: 82/255, alpha: 1.0)

func randomColor() -> UIColor {
    let colors: [UIColor] = [.red, .green, .blue, .magenta, .brown, .black, .yellow, .purple, .gray]
    
    return colors[Int(arc4random_uniform(UInt32(colors.count)))]
}


