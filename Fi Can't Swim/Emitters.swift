//
//  WaterDropEmitter.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/7/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

func prepareSplash() -> SKEmitterNode{

    let splashPath = Bundle.main.path(forResource: "Splash", ofType: "sks")
    let splashNode = NSKeyedUnarchiver.unarchiveObject(withFile: splashPath!) as! SKEmitterNode

    return splashNode
}

func prepareBubbles() -> SKEmitterNode{
    
    let bubblePath = Bundle.main.path(forResource: "Bubble", ofType: "sks")
    let bubbleNode = NSKeyedUnarchiver.unarchiveObject(withFile: bubblePath!) as! SKEmitterNode
    
    return bubbleNode
}
