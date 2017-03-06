//
//  Characters.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/4/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var characterArray: [Character] = []
let characterSkins: [String] = ["Fi_Body1.png","Fi_Body2.png","Fi_Body3.png","Fi_Body4.png","Fi_Body5.png","Fi_Body6.png"]
var currFi: Character!
var currFiIndex = 0

func resetCharacter(node : Character){
    node.zRotation = 0
    node.removeFromParent()
    node.texture = SKTexture(imageNamed: characterSkins[currFiIndex])
}

//instantiate Fi characters
let fi1 = Character(texture: SKTexture(imageNamed: characterSkins[0]))
let fi2 = Character(texture: SKTexture(imageNamed: characterSkins[1]))
let fi3 = Character(texture: SKTexture(imageNamed: characterSkins[2]))
let fi4 = Character(texture: SKTexture(imageNamed: characterSkins[3]))
let fi5 = Character(texture: SKTexture(imageNamed: characterSkins[4]))
let fi6 = Character(texture: SKTexture(imageNamed: characterSkins[5]))

func buildCharacters(){
    
    //give each fi a price
    fi1.price = 0
    fi2.price = 50
    fi3.price = 150
    fi4.price = 250
    fi5.price = 500
    fi6.price = 1000
    
    //add characters to characterArray
    characterArray.append(fi1)
    characterArray.append(fi2)
    characterArray.append(fi3)
    characterArray.append(fi4)
    characterArray.append(fi5)
    characterArray.append(fi6)
    
    currFi = characterArray[currFiIndex]
    currFi.name = "currFi"
}
