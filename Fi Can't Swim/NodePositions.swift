//
//  NodePositions.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let centerX = CGFloat(UIScreen.main.bounds.width / 2)
let centerY = CGFloat(UIScreen.main.bounds.height / 2)
let centerScreen = CGPoint(x: centerX, y: centerY)

let TitlePosition = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height * 0.92)
let BackButtonPosition = CGPoint(x: UIScreen.main.bounds.width * 0.1, y: UIScreen.main.bounds.height * 0.95)
let ScoreLabelPosition = CGPoint(x: UIScreen.main.bounds.width * 0.85, y: UIScreen.main.bounds.height * 0.95)
let LevelLabelPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.95)


var startP = CGPoint()
var landP = CGPoint()
var characterP = CGPoint()

//beginning platform position
var startPosition1 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.8)
var startPosition2 = CGPoint(x: deviceWidth * 0.9, y: deviceHeight * 0.8)
var startPosition3 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.2)
var startPosition4 = CGPoint(x: deviceWidth * 0.9, y: deviceHeight * 0.2)

//fi beginning position based on beginning platform position

var landingPosition1 = CGPoint(x: deviceWidth * 0.9, y: deviceHeight * 0.2)
var landingPosition2 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.2)
var landingPosition3 = CGPoint(x: deviceWidth * 0.5, y: deviceHeight * 0.2)
