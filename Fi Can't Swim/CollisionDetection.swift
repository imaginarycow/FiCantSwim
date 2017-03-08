//
//  CollisionDetection.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/3/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

//collision bitmasks
let fiCategory: UInt32 = 0x1 << 0
let coinCategory: UInt32 = 0x1 << 1
let flagCategory: UInt32 = 0x1 << 2
let canonCategory: UInt32 = 0x1 << 3
let slideCategory: UInt32 = 0x1 << 4
let waterCategory: UInt32 = 0x1 << 5
