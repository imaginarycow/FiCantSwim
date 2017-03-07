//
//  MapScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class MapScene : SKScene {
    
    let title = Label(label: "Level Select", fontColor: fiColor, fontSize: 30.0)
    let backButton = BackButton()
    var levelIcons: [LevelIcon] = []
    var levelsBuilt = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        deviceWidth = self.view!.bounds.size.width
        //backgroundColor = .white
        
        let bg = SKSpriteNode(imageNamed: "Sky.png")
        bg.size = CGSize(width: deviceWidth, height: deviceHeight)
        bg.position = centerScreen
        bg.zPosition = backgroundZPosition
        addChild(bg)
        
        
        title.position = CGPoint(x: (self.view?.bounds.width)! / 2, y: (self.view?.bounds.height)! * 0.90)
        title.zPosition = 10
        self.addChild(title)
        
        backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(backButton)
        
        if !levelsBuilt{buildLevels()}
        
    }
    override func willMove(from view: SKView) {
        self.removeAllChildren()
    }
    
    func buildLevels(){

        let iconSpace = deviceWidth / NumberOfIconsPerRow
        var count:CGFloat = 1
        var row:CGFloat = 1
        var rCount = 0
        var rIndex = 0
        for index in 1...NumberOfLevels {

            var icon:LevelIcon!
            
            if row.truncatingRemainder(dividingBy: 2) == 0 {
                
                if rCount > 4 {
                    rCount = 0
                }
                if rCount == 0 {
                    rIndex = index + 4
                }
                
                icon = LevelIcon(levelNum: rIndex)
                rIndex -= 1
                rCount += 1
            }
            else {
                icon = LevelIcon(levelNum: index)
            }
            icon.zPosition = labelZPosition
            levelIcons.append(icon)
            let label = Label(label: String(icon.lvlNum), fontColor: .white, fontSize: 15.0)
            icon.position = CGPoint(x: 0.0 + (iconSpace * count) - (iconSpace / 2), y: deviceHeight * 0.92 - iconSpace * row)
            
            if count.truncatingRemainder(dividingBy: 2) == 0 {
                icon.position = CGPoint(x: 0.0 + (iconSpace * count) - (iconSpace / 2), y: deviceHeight * 0.92 - iconSpace * row - iconSpace/2)
            }
            self.addChild(icon)
            icon.addChild(label)
            count += 1
            
            //start new row
            if count == 6{
                count = 1
                row += 1
            }
        }
        levelsBuilt = true
       connectLevels()
    }
    
    //draw connecting lines for level icons
    func connectLevels(){
        
        var index = 0
        
        for _ in levelIcons {
            
            if (index < NumberOfLevels-1){
                
                let icon1 = levelIcons[index]
                var icon2 = levelIcons[index]
                
                for icon in levelIcons {
                    if icon.lvlNum == icon1.lvlNum + 1{
                        icon2 = icon
                    }
                }

                var points = [icon1.position, icon2.position]
                let linearShapeNode = SKShapeNode(points: &points, count: points.count)
                linearShapeNode.strokeColor = icon2.unlocked ? .green : fiColor
                linearShapeNode.lineWidth = 5.0
                linearShapeNode.zPosition = labelZPosition
                addChild(linearShapeNode)
                
                index += 1
                
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            //go to selected scene if it is unlocked
            for icon in levelIcons{
                if icon.contains(location){
                    //go to corresponding level
                    currLevel = icon.lvlNum
                    sceneTransition(initScene: self, nextScene: GameScene())
                }
            }
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MenuScene())
            }
            
        }
    }
    
    
}
