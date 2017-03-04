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
var levelScore = 0
var score = 0
var lives = 3
var coinCount = 0

//constants for Map Scene
let NumberOfLevels: Int = 35
let NumberOfIconsPerRow:CGFloat = 5
let NumberOfRows: Int = NumberOfLevels / Int(NumberOfIconsPerRow)

let maxVector = CGVector(dx: 300.0, dy: 300.0)





