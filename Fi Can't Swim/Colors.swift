//
//  Colors.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/2/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var currColorScheme: ColorScheme = colorScheme2

let fiColor: UIColor = UIColor(colorLiteralRed: 247/255, green: 82/255, blue: 82/255, alpha: 1.0)
let custBlue = UIColor(colorLiteralRed: 0/255, green: 118/255, blue: 163/255, alpha: 1.0)


let custPurple = UIColor(colorLiteralRed: 91/255, green: 11/255, blue: 134/255, alpha: 1.0)
let custYellow = UIColor(colorLiteralRed: 218/255, green: 202/255, blue: 1/255, alpha: 1.0)

let custLightBlue = UIColor(colorLiteralRed: 10/255, green: 185/255, blue: 228/255, alpha: 1.0)
let colors: [UIColor] = [.red, .green, .blue, .magenta, .brown, custBlue, custPurple, custYellow, custLightBlue, .yellow, .purple, .gray, .cyan, .orange]

func randomColor() -> UIColor {
    
    return colors[Int(arc4random_uniform(UInt32(colors.count)))]
}

let colorScheme1 = ColorScheme(bg: "Sky1.png", primColor: .red, secColor: .blue, buttColor: .blue, labelColor: .blue)

let colorScheme2 = ColorScheme(bg: "Sky1.png", primColor: custBlue, secColor: .white, buttColor: .white, labelColor: fiColor)

let colorScheme3 = ColorScheme(bg: "Sky3.png", primColor: custPurple, secColor: custYellow, buttColor: custYellow, labelColor: custYellow)
