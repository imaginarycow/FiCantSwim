//
//  GameLabelsAndButtons.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 3/15/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func buildLabels(){
        
        title.position = TitlePosition
        //self.addChild(title)
        
        levelLabel.position = LevelLabelPosition
        self.addChild(levelLabel)
        
        coinsLabel.position = ScoreLabelPosition
        self.addChild(coinsLabel)
        
        backButton.position = BackButtonPosition
        self.addChild(backButton)
        
        //boost button
        boostButton.position = BoostButtonPosition
        boostButton.size = characterSize
        boostButton.zPosition = 7
        addChild(boostButton)
        
        let boostButtonLabel = Label(label: "Boost", fontSize: boostButton.size.height * 0.2)
        boostButtonLabel.position = CGPoint(x: 0.0, y: 0.0 - boostButtonLabel.fontSize)
        boostButtonLabel.fontColor = currColorScheme.buttonColor
        boostButton.addChild(boostButtonLabel)
        
        boostNumbLabel = Label(label: String(boostsRemaining), fontSize: boostButton.size.height * 0.2)
        boostNumbLabel.position = CGPoint(x: 0.0, y: 0.0)
        boostNumbLabel.fontColor = currColorScheme.buttonColor
        boostButton.addChild(boostNumbLabel)
        
    }
    
}
