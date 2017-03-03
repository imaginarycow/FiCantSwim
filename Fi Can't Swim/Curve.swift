//
//  Curve.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/28/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

let curveSize = CGSize(width: characterSize.width * 0.75, height: characterSize.height * 0.75)

class Curve : SKShapeNode{
    
    init(name: String, centerPoint: CGPoint) {
        super.init()
        self.lineWidth = 8
        self.strokeColor = randomColor()
        self.zPosition = 5
        self.name = name
        
        let path = CGMutablePath()
        let startPoint = CGPoint(x: centerPoint.x + curveSize.width, y: centerPoint.y)
        let midPoint1 = CGPoint(x: centerPoint.x + curveSize.width * 0.8, y: centerPoint.y - curveSize.height)
        let midPoint2 = CGPoint(x: centerPoint.x - curveSize.width * 0.8, y: centerPoint.y - curveSize.height)
        let endPoint = CGPoint(x: centerPoint.x - curveSize.width, y: centerPoint.y)
        
        path.move(to: startPoint)
        path.addCurve(to: endPoint, control1: midPoint1, control2: midPoint2)
        
        self.path = path
        
        self.physicsBody?.mass = 1.0
        self.physicsBody = SKPhysicsBody(edgeChainFrom: path)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


