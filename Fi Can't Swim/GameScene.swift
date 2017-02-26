//
//  GameScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class GameScene : SKScene {
    
    let title = Label(label: "Game", fontSize: 30.0)
    let levelLabel = Label(label: "Level \(currLevel)", fontSize: 20.0)
    let scoreLabel = Label(label: "Score \(levelScore)", fontSize: 15.0)
    
    let backButton = BackButton()
    let water_front = Water()
    let water_back = Water()
    let fi = Character(type: .character, texture: SKTexture(image: #imageLiteral(resourceName: "Fi_Body.png")), color: .white, size: characterSize, isDynamic: true)
    let startingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)
    let landingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)

    let slide = SKShapeNode()
    var slides: [Slide] = []
    var points: [CGPoint] = []
    var path :CGPath!
    
    
    let nextSceneButton = Label(label: "Next Level Please", fontSize: 50.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .white
        buildLabels()
        
        //set platform and character positions in loadLevel
        loadLevel(level: currLevel, parent: self)
        addChild(startingPlatform)
        addChild(landingPlatform)
        addChild(fi)
        startingPlatform.position = startP
        landingPlatform.position = landP
        fi.position = characterP
        fi.physicsBody?.affectedByGravity = true
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        
        
        delay(delay: 3.0, closure: {
            print("applying force after delay")
            self.startingPlatform.zRotation = -(CGFloat)(45.degreesToRadians)
            self.fi.physicsBody?.applyForce(CGVector(dx: 300.0, dy: 0.0))
        })
        
        loadWater()
        
        //nextSceneButton.position = centerScreen
        //addChild(nextSceneButton)
        
    }
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    func buildLabels(){
        
        title.position = TitlePosition
        //self.addChild(title)
        
        levelLabel.position = LevelLabelPosition
        self.addChild(levelLabel)
        
        scoreLabel.position = ScoreLabelPosition
        self.addChild(scoreLabel)
        
        backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)
        self.addChild(backButton)
        
        //backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)


    }
    func updateScore(){
        //save level score
        
    }
    func beatLevel(){
        
        //count points 
        currLevel += 1
        if currLevel > NumberOfLevels {
            //player beat game
            sceneTransition(initScene: self, nextScene: WinScene())
        }
        else {
            sceneTransition(initScene: self, nextScene: GameScene())
        }
        
    }
    func loseLevel() {
        sceneTransition(initScene: self, nextScene: MapScene())
    }
    
    func loadWater(){
        
        water_front.position = CGPoint(x: centerX, y: 0.0 + water_front.size.height/2)
        water_front.zPosition = fi.zPosition + 1
        addChild(water_front)
        
        water_back.position = CGPoint(x: centerX, y: 0.0 + water_front.size.height * 0.65)
        water_back.zPosition = fi.zPosition - 1
        water_back.alpha = 0.6
        addChild(water_back)
        
        moveWater()
    }
    func moveWater(){
        water_front.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0)])))
        
        water_back.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0)])))
    }
    
    func updateSlide() {

    }
    //create the slide path from points made by user dragging finger on screen
    func createPath() -> CGPath? {
        //1
        if points.count <= 1 {
            print("No points in points array")
            return nil
        }
        //2
        let path = CGMutablePath()
        
        //3
        var i = 0
        for point in points{
            let p = point
            
            //4
            if i == 0 {
                path.move(to: CGPoint(x: p.x,y: p.y))
            } else {
                path.addLine(to: CGPoint(x: p.x, y: p.y))
            }
            i += 1
        }
        print("create path method called")
        print("\(points.count) points in points array")
        return path
    }
    //draw slide from points array
    func drawLines() {
        print("draw lines method called")
        //1
        enumerateChildNodes(withName: "line", using: {node, stop in
            node.removeFromParent()
        })
        
        //2
        //enumerateChildNodes(withName: "slide", using: {node, stop in
            //3
            //let slide = node as! SKShapeNode
            if let path = self.createPath(){
                
                let slide = Slide(name: "line", path: path)
                slide.active = true
                self.addChild(slide)
                slides.append(slide)
                print("adding slide")
            }
        //})
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for point in points {
            print(point)
        }
        drawLines()
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            points.append(location)
            drawLines()
            path = createPath()
            
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            super.touchesBegan(touches, with: event)
            
            let location = touch.location(in: self)
            
            if location != backButton.position {
                points = []
                points.append(location)
                path = createPath()

            }
            
            //if nextSceneButton.contains(location){
            //    beatLevel()
            //}
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
        }
    }
    override func update(_ currentTime: TimeInterval) {
        if !fi.checkForMovement() {
            //loseLevel()
        }
    }

    
}
