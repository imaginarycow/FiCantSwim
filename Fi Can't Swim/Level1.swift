//
//  Level1.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/22/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit


func loadLevel1(parent: SKScene) {
    
    let landing1 = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)
    let landing2 = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)

    landing1.position = CGPoint(x: (parent.view?.bounds.width)! * 0.1, y: (parent.view?.bounds.height)! * 0.8)
    //landing.size = CGSize(width: deviceWidth * 0.4, height: deviceHeight * 0.07)
    parent.addChild(landing1)
    
    landing2.position = CGPoint(x: (parent.view?.bounds.width)! * 0.9, y: (parent.view?.bounds.height)! * 0.15)
    //landing2.size = CGSize(width: deviceWidth * 0.4, height: deviceHeight * 0.05)
    parent.addChild(landing2)
    
    let fi = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "Fi_Body.png")), size: characterSize, isDynamic: true)
    fi.position = CGPoint(x: landing1.position.x, y: landing1.position.y + fi.size.height)
    parent.addChild(fi)
    
    
    
}
