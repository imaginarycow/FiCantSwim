//
//  BackButton.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/26/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class BackButton : SKSpriteNode {
    
    var text:String?
    
    override init(texture: SKTexture?, color: UIColor, size:CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.size = CGSize(width: 50.0,height: 30.0)
        self.zPosition = labelZPosition
        self.addBackButtonLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackButtonLabel(){
        let backButton = BackButtonLabel()
        backButton.position = CGPoint(x: self.position.x, y: self.position.y - self.size.height/3)
        self.addChild(backButton)
    }
    
}

class BackButtonLabel : Label {
    
    
    init(label: String = "Back", fontColor: UIColor = currColorScheme.labelColor, fontSize: CGFloat = 15.0) {
        super.init(label: label, fontColor: fontColor, fontSize: fontSize, fontName: defaultFont)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


