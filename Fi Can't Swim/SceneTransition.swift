//
//  SceneTransition.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var currView:SKView!

func sceneTransition(initScene : SKScene, nextScene : SKScene){
    
    let transition = SKTransition.fade(withDuration: 1.0)
    nextScene.scaleMode = .aspectFill
    nextScene.size = initScene.size
    currView.presentScene(nextScene, transition: transition)
}
