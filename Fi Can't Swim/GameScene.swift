//
//  GameScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit


class GameScene : SKScene, SKPhysicsContactDelegate {
    
    
    //labels and buttons
    let title = Label(label: "Game", fontSize: 30.0)
    let levelLabel = Label(label: "Level \(currLevel)", fontSize: 20.0)
    let coinsLabel = Label(label: "Coins \(coinCount)", fontSize: 15.0)
    let boostButton = Label(label: "Boost", fontSize: 20.0)
    let backButton = BackButton()
    let restartLevelButton = Label(label: "Restart Level", fontSize: 20.0)
    
    let water_front = Water()
    let water_back = Water()
    let startingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)
    let landingPlatform = GameObject(texture: SKTexture(image: #imageLiteral(resourceName: "landing1.png")), size: landingSize)

    let slide = SKShapeNode()
    var slides: [Slide] = []
    var points: [CGPoint] = []
    var path :CGPath!
    var catcher: SKShapeNode!
    let finishFlag = SKSpriteNode(imageNamed: "flag.png")
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        setBackground()
        buildLabels()
        
        // 1
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        // 2
        borderBody.friction = 0
        // 3
        self.physicsBody = borderBody
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        
        //set platform and character positions in loadLevel
        loadLevel(level: currLevel, parent: self)
        addChild(startingPlatform)
        startingPlatform.position = startP
        landingPlatform.position = catcherPosition
        
        setFiInScene()
        
        addCatcher()
        addCoins()
        
        
        
        //wait for 3 seconds, then apply force to character
        delay(delay: 3.0, closure: {
            print("applying force after delay")
            self.startingPlatform.zRotation = -(CGFloat)(45.degreesToRadians)
            currFi.physicsBody?.applyForce(CGVector(dx: 300.0, dy: 0.0))
        })
        
        loadWater()
        
        restartLevelButton.position = CGPoint(x: deviceWidth * 0.8, y: deviceHeight * 0.9)
        addChild(restartLevelButton)
        
    }
    override func willMove(from view: SKView) {
        currFi.removeFromParent()
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func setBackground() {
        
        let bg = SKSpriteNode(imageNamed: "Sky.png")
        bg.size = CGSize(width: deviceWidth, height: deviceHeight)
        bg.position = centerScreen
        bg.zPosition = 1
        addChild(bg)
    }
    
    func setFiInScene() {
        print("curr fi index: \(currFiIndex)")
        resetCharacter(node: currFi)
        currFi.size = characterSize
        currFi.position = characterP
        addChild(currFi)
    }
    
    func addCatcher(){
        
        catcher = Curve(name: "curve", centerPoint: catcherPosition)
        addChild(catcher)
        finishFlag.size = CGSize(width: curveSize.width * 1.25, height: curveSize.height * 1.25)
        finishFlag.position = CGPoint(x: catcherPosition.x + finishFlag.size.width/2, y: catcherPosition.y)
        finishFlag.zPosition = (currFi.zPosition) - 1
        addChild(finishFlag)
    }
    
    func buildLabels(){
        
        title.position = TitlePosition
        //self.addChild(title)
        
        levelLabel.position = LevelLabelPosition
        self.addChild(levelLabel)
        
        coinsLabel.position = ScoreLabelPosition
        self.addChild(coinsLabel)
        
        backButton.position = BackButtonPosition
        self.addChild(backButton)
        
        boostButton.position = CGPoint(x: deviceWidth * 0.5, y: deviceHeight * 0.2)
        boostButton.zPosition = 4
        addChild(boostButton)

    }
    func addCoins(){
        coins = []
        
        let coin1 = Coin(value: 7)
        coin1.position = centerScreen
        coins.append(coin1)
        addChild(coin1)
    }
    func updateCoinCount(value: Int){
        //TODO save this new coin count in gameData
        coinCount += value
        coinsLabel.text = "Coins: \(coinCount)"
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
            sceneTransition(initScene: self, nextScene: MapScene())
        }
        
    }
    func loseLevel() {
        sceneTransition(initScene: self, nextScene: LoseScene())
    }
    
    func loadWater(){
        
        water_front.position = CGPoint(x: centerX, y: 0.0 + water_front.size.height/2)
        water_front.zPosition = (currFi.zPosition) + 1
        addChild(water_front)
        
        water_back.position = CGPoint(x: centerX, y: 0.0 + water_front.size.height * 0.65)
        water_back.zPosition = (currFi.zPosition) - 1
        water_back.alpha = 0.6
        addChild(water_back)
        
        moveWater()
    }
    func moveWater(){
        water_front.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0)])))
        
        water_back.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: -50.0, y: 0.0, duration: 2.0), SKAction.moveBy(x: 50.0, y: 0.0, duration: 2.0)])))
    }
    //Give fi a boost of speed
    func applyBoost() {
        
        if currFi.waypoints.count < 2{
            return
        }
        
        let pointsCount = currFi.waypoints.count
        let point2 = currFi.waypoints[pointsCount-1]
        let point1 = currFi.waypoints[pointsCount-2]
        
        //1 Get vector for boost from fi.waypoints
        var vector = CGVector()
        vector.dx = point2.x < point1.x ? point2.x - point1.x * 10 : point2.x - point1.x * -10
        vector.dy = point2.y < point1.y ? point2.y - point1.y * 10 : point2.y - point1.y * -10
        
        if vector.dx > maxVector.dx{
            vector.dx = maxVector.dx
        }
        if vector.dy > maxVector.dy{
            vector.dy = maxVector.dy
        }
        
        //2 Apply boost
        currFi.physicsBody?.applyForce(vector)
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
    
    func removeCoinInStyle(node: SKNode){
        
        if node.parent != nil {
            var value = 0
            //TODO add sounds and particle emitter
            if coins.contains(node as! Coin){
                
                print("removing coin from coins array")
                
            }
            node.removeFromParent()
            var index = 0
            for coin in coins {
                if coin.parent == nil{
                    value = coin.value
                    print("value of coin was \(value)")
                    coins.remove(at: index)
                }
                index += 1
            }
            //update coin count
            updateCoinCount(value: value)
        }
        
    }

    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        // 2
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        let contactPoint: CGPoint = contact.contactPoint
        // 3
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == coinCategory {
            print("Fi touched the coin")
            
            //Remove the coin in style
            removeCoinInStyle(node: secondBody.node!)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for point in points {
            print(point)
        }
        drawLines()
        
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
       
        if currFi.position.y < deviceHeight * 0.1{
            loseLevel()
        }
        currFi.waypoints.append(currFi.position)
    }

    
}
