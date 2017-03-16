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
let BoostButtonPosition = CGPoint(x: deviceWidth * 0.5, y: deviceHeight * 0.01 + characterSize.height/2)

var startP = CGPoint()
var catcherPosition = CGPoint()
var characterP = CGPoint()

//beginning platform position
var startPosition1 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.8)
var startPosition2 = CGPoint(x: deviceWidth * 0.9, y: deviceHeight * 0.8)
var startPosition3 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.2)
var startPosition4 = CGPoint(x: deviceWidth * 0.9, y: deviceHeight * 0.2)

//fi beginning position based on beginning platform position
var catcherPosition1 = CGPoint(x: deviceWidth * 0.99 - curveSize.width, y: deviceHeight * 0.2)
var catcherPosition2 = CGPoint(x: deviceWidth * 0.1, y: deviceHeight * 0.2)
var catcherPosition3 = CGPoint(x: deviceWidth * 0.5, y: deviceHeight * 0.2)


//ZPositions
let backgroundZPosition:CGFloat = 1
let labelZPosition:CGFloat = 2
let characterZPosition:CGFloat = 5
let slideZPosition:CGFloat = 4
let coinZPosition:CGFloat = 5
let platformZPosition:CGFloat = 5

//Coin positions
let coinPosition1 = CGPoint(x: deviceWidth * 0.35, y: deviceHeight * 0.80)
let coinPosition2 = CGPoint(x: deviceWidth * 0.50, y: deviceHeight * 0.80)
let coinPosition3 = CGPoint(x: deviceWidth * 0.75, y: deviceHeight * 0.80)
let coinPosition4 = CGPoint(x: deviceWidth * 0.15, y: deviceHeight * 0.55)
let coinPosition5 = CGPoint(x: deviceWidth * 0.45, y: deviceHeight * 0.55)
let coinPosition6 = CGPoint(x: deviceWidth * 0.85, y: deviceHeight * 0.55)
let coinPosition7 = CGPoint(x: deviceWidth * 0.20, y: deviceHeight * 0.25)
let coinPosition8 = CGPoint(x: deviceWidth * 0.45, y: deviceHeight * 0.25)
let coinPosition9 = CGPoint(x: deviceWidth * 0.85, y: deviceHeight * 0.25)
















