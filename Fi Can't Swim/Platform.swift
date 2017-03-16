//
//  Platform.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/23/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var platformSize:CGSize?
let platformSize1:CGSize = CGSize(width: characterSize.width, height: characterSize.height/3)
let platformSize2:CGSize = CGSize(width: characterSize.width * 1.5, height: characterSize.height/2)
let platformTextures:[String] = ["platform1.png", "platform2.png"]
var platformTexture = ""
let platformSizes: [CGSize] = [platformSize1, platformSize2]
