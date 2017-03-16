//
//  Level1.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/22/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

//set object positions, background, colors
func loadLevel1(parent: SKScene) {
    
    //set scene colors, background

    
    currFi.isMoving = false
    //set node positions
    platformTexture = platformTextures[1]
    platformSize = platformSizes[1]
    startP = startPosition1
    catcherPosition = catcherPosition1
    characterP = CGPoint(x: startP.x, y: startP.y + characterSize.height * 0.6)
    levelScore = 0
    vector = CGVector(dx: 350.0, dy: 0.0)
    
    
}
