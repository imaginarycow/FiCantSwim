//
//  GameData.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/4/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//


import SpriteKit

let gameData = UserDefaults()
var levelScore = 0
var score = 0
var livesRemaining = 3
var coinCount = 0
var hasRun = false
var lockedLevelsNumb = NumberOfLevels - 1


func loadGameData(){
    
    hasRun = gameData.bool(forKey: "hasRun")
    
    if !hasRun{
        //Send to FireBase for new install trigger
        
        //Do nothing, use default values
        return
    }
    //if we get here, game has run before, so load saved data
    
    //Set currFi to last selected
        currFi = characterArray[gameData.integer(forKey: "currFiIndex")]
    //Set number of lives
        livesRemaining = gameData.integer(forKey: "livesRemaining")
    // Set coin count
        coinCount = gameData.integer(forKey: "coinCount")
    //set Locked Levels
        lockedLevelsNumb = gameData.integer(forKey: "lockedLevelsNumb")
}
