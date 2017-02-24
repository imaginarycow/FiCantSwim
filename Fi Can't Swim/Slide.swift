//
//  Slide.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

//var wayPoints: [CGPoint] = []
var velocity = CGPoint(x: 0, y: 0)

class Slide: SKShapeNode {
    
    var wayPoints: [CGPoint] = []
    var active = false
    
    init(name: String) {
        super.init()
        self.fillColor = .green
        self.lineWidth = 10.0
        self.strokeColor = .green
        self.name = name
        //super.init(texture: texture, color: nil, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func appendPoint(point: CGPoint) {
        wayPoints.append(point)
    }
}
