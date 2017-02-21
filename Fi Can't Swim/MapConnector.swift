//
//  IconConnector.swift
//  Fi Can't Swim
//
//  Created by ramiro beltran on 2/20/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class MapConnection : SKShapeNode {
    
    var size = CGSize(width: 0, height: 0)
    convenience init(rectOfSize size: CGSize) {
        self.init(rect: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 50.0), cornerRadius: CGFloat(10.0), color: .black)
        self.size = size
    }
    
    init(rect: CGRect, cornerRadius: CGFloat, color: UIColor) {
        super.init()
        //super.init()
        self.fillColor = color
        self.strokeColor = color
    }
    
//    init(size: CGSize, color: UIColor, radius: CGFloat){
//        //super.init(rect: CGRect(origin: CGPoint(x:0.0, y:0.0), size: CGSize(width: size.width, height: size.height)))
//        super.init()
//        self.fillColor = color
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
