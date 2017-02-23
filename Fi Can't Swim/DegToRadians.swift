//
//  DegToRadians.swift
//  Fi Can't Swim
//
//  Created by ramiro beltran on 2/20/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import Foundation

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

