//
//  Level.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/21/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var currLevel = 1


func loadLevel(level: Int, parent: SKScene){
    
    switch level {
    case 1:
        loadLevel1(parent: parent)
    default:
        loadLevel1(parent: parent)
    }
    
}
