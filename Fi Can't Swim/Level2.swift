//
//  Level2.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/12/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

//set object positions, background, colors
func loadLevel2(parent: SKScene) {
    
    currFi.isMoving = false
    startP = startPosition1
    catcherPosition = catcherPosition1
    characterP = CGPoint(x: startP.x, y: startP.y + characterSize.height * 0.6)
    
    
    levelScore = 0
    
    
    
}
