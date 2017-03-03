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
    let boostButton = Label(label: "Boost", fontSize: 20.0)
    
    let backButton = BackButton()
    let water_front = Water()
    let water_back = Water()
    let fi = Character(type: .character, texture: SKTexture(image: currFi), color: .white, size: characterSize, isDynamic: true)
    let startingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)
    let landingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)

    let slide = SKShapeNode()
    var slides: [Slide] = []
    var points: [CGPoint] = []
    var path :CGPath!
    var catcher: SKShapeNode!
    let finishFlag = SKSpriteNode(imageNamed: "flag.png")
    
    
    
    let restartLevelButton = Label(label: "Restart Level", fontSize: 20.0)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .yellow
        buildLabels()
        
        //set platform and character positions in loadLevel
        loadLevel(level: currLevel, parent: self)
        addChild(startingPlatform)
        addChild(fi)
        startingPlatform.position = startP
        landingPlatform.position = catcherPosition
        fi.position = characterP
        addCatcher()
        addCoins()
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        
        
        delay(delay: 3.0, closure: {
            print("applying force after delay")
            self.startingPlatform.zRotation = -(CGFloat)(45.degreesToRadians)
            self.fi.physicsBody?.applyForce(CGVector(dx: 300.0, dy: 0.0))
        })
        
        loadWater()
        
        restartLevelButton.position = CGPoint(x: deviceWidth * 0.8, y: deviceHeight * 0.9)
        addChild(restartLevelButton)
        
    }
    override func willMove(from view: SKView) {
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func addCatcher(){
        
        catcher = Curve(name: "curve", centerPoint: catcherPosition)
        addChild(catcher)
        finishFlag.size = CGSize(width: curveSize.width * 1.25, height: curveSize.height * 1.25)
        finishFlag.position = CGPoint(x: catcherPosition.x + finishFlag.size.width/2, y: catcherPosition.y)
        finishFlag.zPosition = fi.zPosition - 1
        addChild(finishFlag)
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
        
        boostButton.position = CGPoint(x: deviceWidth * 0.5, y: deviceHeight * 0.2)
        boostButton.zPosition = 4
        addChild(boostButton)
        
        //backButton.position = BackButtonPosition //CGPoint(x: (self.view?.bounds.width)! * 0.1, y: (self.view?.bounds.height)! * 0.9)


    }
    func addCoins(){
        
        let coin1 = Coin(value: 5)
        coin1.position = centerScreen
        addChild(coin1)
    }
    func updateScore(){
        //save level score
        
    }
    func beatLevel(beat : Bool){
        
        if beat {
            //count points
            currLevel += 1
        }
        
        if currLevel > NumberOfLevels {
            //player beat game
            sceneTransition(initScene: self, nextScene: WinScene())
        }
        else {
            sceneTransition(initScene: self, nextScene: GameScene())
        }
        
    }
    func loseLevel() {
        sceneTransition(initScene: self, nextScene: LoseScene())
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
    
    func applyBoost() {
        
        if fi.waypoints.count < 2{
            return
        }
        
        let pointsCount = fi.waypoints.count
        let point2 = fi.waypoints[pointsCount-1]
        let point1 = fi.waypoints[pointsCount-2]
        
        //1 Get vector for boost from fi.waypoints
        var vector = CGVector()
        vector.dx = point2.x < point1.x ? point2.x - point1.x * 10 : point2.x - point1.x * -10
        vector.dy = point2.y < point1.y ? point2.y - point1.y * 10 : point2.y - point1.y * -10
        
        
        //2 Apply boost
        fi.physicsBody?.applyForce(vector)
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
        //drawLines()
        
        boostButton.alpha = 1.0
        
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
            
            if location != backButton.position && location != boostButton.position {
                points = []
                points.append(location)
                path = createPath()

            }
            if boostButton.contains(location) {
                //apply boost to character
                boostButton.alpha = 0.5
                applyBoost()
            }
            
            if restartLevelButton.contains(location){
                beatLevel(beat: false)
            }
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
        }
    }
    override func update(_ currentTime: TimeInterval) {
        if fi.position.y < deviceHeight * 0.1{
            loseLevel()
        }
        fi.waypoints.append(fi.position)
    }

    
}
