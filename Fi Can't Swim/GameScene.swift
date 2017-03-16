//
//  GameScene.swift
//  Fi Can't Swim
//
//  Created by Ramiro Beltran on 2/19/17.
//  Copyright © 2017 Ramiro Beltran. All rights reserved.
//

import SpriteKit
import AVFoundation


class GameScene : SKScene, SKPhysicsContactDelegate {
    
    
    //labels and buttons
    let title = Label(label: "Game", fontSize: 30.0)
    let levelLabel = Label(label: "Level \(currLevel)", fontSize: 20.0)
    let coinsLabel = Label(label: "Coins \(coinCount)", fontSize: 15.0)
    let boostButton = SKSpriteNode(imageNamed: "Level_Icon.png")
    var boostNumbLabel = Label(label: "3", fontSize: 10.0)
    let backButton = BackButton()
    
    let startingPlatform = GameObject()
    let water_front = Water()
    let water_back = Water()
    let slide = SKShapeNode()
    var slides: [Slide] = []
    var points: [CGPoint] = []
    var path :CGPath!
    var catcher: SKShapeNode!
    let finishFlag = SKSpriteNode(imageNamed: "flag.png")
    var splash = SKEmitterNode()
    
    //booleans
    var flagTouched = false
    var leveLostCalled = false
    var levelBeat = false
    var fiTouchingSlide = false
    
    //game stuff
    var winTimer: Timer!
    var seconds = 0
    var boostsRemaining = maxNumberBoosts
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //reset scene bools
        leveLostCalled = false
        levelBeat = false
        fiTouchingSlide = false
        currFi.isMoving = false
        setBackground()
        buildLabels()
        coins = []
        winTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
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
        
        startingPlatform.texture = SKTexture(imageNamed: platformTexture)
        startingPlatform.size = platformSize!
        addChild(startingPlatform)
        startingPlatform.position = startP
        
        setFiInScene()
        addCatcher()
        addCoins()
        
        loadWater()
    
        //wait for 3 seconds, then apply force to character
        delay(delay: 3.0, closure: {
            print("applying force after delay")
            //self.startingPlatform.zRotation = -(CGFloat)(45.degreesToRadians)
            currFi.physicsBody?.applyForce(vector)
        })
        
    }
    override func willMove(from view: SKView) {

        //currFi.removeFromParent()
        self.removeAllActions()
        self.removeAllChildren()
    }
    
    func setBackground() {
        
        let bg = SKSpriteNode(imageNamed: currColorScheme.background)
        bg.size = CGSize(width: deviceWidth, height: deviceHeight)
        bg.position = centerScreen
        bg.zPosition = 1
        addChild(bg)
    }
    
    func setFiInScene() {
        //fi position gets set in loadLevel
        print("curr fi index: \(currFiIndex)")
        resetCharacter(node: currFi)
        currFi.size = characterSize
        currFi.position = characterP
        addChild(currFi)
    }
    
    func addCatcher(){
        //catcher position gets set in loadLevel
        catcher = Curve(name: "curve", centerPoint: catcherPosition)
        addChild(catcher)
        
        finishFlag.size = CGSize(width: curveSize.width * 1.25, height: curveSize.height * 1.25)
        finishFlag.position = CGPoint(x: catcherPosition.x + finishFlag.size.width/2, y: catcherPosition.y)
        finishFlag.zPosition = (currFi.zPosition) - 1
        finishFlag.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "flag.png"), size: finishFlag.size)
        finishFlag.physicsBody?.isDynamic = false
        finishFlag.physicsBody?.usesPreciseCollisionDetection = true
        finishFlag.physicsBody?.categoryBitMask = flagCategory
        finishFlag.physicsBody?.contactTestBitMask = fiCategory
        addChild(finishFlag)
    }
    
    func addPositionPoint(point: CGPoint) {
        let diff = point.x - characterP.x
        //add new point if fi waypoints array is empty
        if diff < abs(5) {
            currFi.isMoving = false
        }
        //check to see if new point matches last point before adding
        else {
            currFi.waypoints.append(point)
            currFi.isMoving = true
        }
    }
    //used to see if fi is still moving
    func getIsFiMoving() {
        //compare fi waypoints to see if fi is still moving
        let point1 = currFi.waypoints[currFi.waypoints.count - 5]
        let point2 = currFi.waypoints[currFi.waypoints.count - 1]
        let diff = point2.y - point1.y
        //check if point2.x is within 1 of point1.x
        if diff < abs(0.001) {
            currFi.isMoving = false
        }
        else {
            currFi.isMoving = true
        }
        
    }

    func beatLevel(beat : Bool){
        print("Fi beat level")
        winTimer.invalidate()
        seconds = 0
        currFi.waypoints = []
        if beat && levelBeat == false{
            levelBeat = true
            //TODO count points
            currLevel += 1
        }
        //check if player beat last level
        if currLevel > NumberOfLevels {
            print("curr level is greater than number of levels")
            //player beat game
            sceneTransition(initScene: self, nextScene: WinScene())
        }
        else {
            showBeatLevelAnimation()
            delay(delay: 3.0, closure: {
                sceneTransition(initScene: self, nextScene: GameScene())
            })
        }
        
    }
    func showBeatLevelAnimation() {
        
        let winLabel = SKLabelNode(text: "#Winner")
        winLabel.fontColor = custYellow
        winLabel.fontSize = 32.0
        winLabel.fontName = defaultFont
        winLabel.position = centerScreen
        winLabel.zPosition = 10
        addChild(winLabel)
        
        removeSlide()
    }
    
    func loseLevel() {
        
        let loseLabel = SKLabelNode(text: "#Fi Can't Swim")
        loseLabel.fontColor = fiColor
        loseLabel.fontSize = 32.0
        loseLabel.fontName = defaultFont
        loseLabel.position = centerScreen
        loseLabel.zPosition = 10
        loseLabel.alpha = 0
        addChild(loseLabel)
        //loseLabel.run(SKAction.fadeIn(withDuration: 1.0))
        
        playSplashSound()
        
        currFi.removeFromParent()
        removeSlide()
        delay(delay: 2.0, closure: {
            print("lose scene transition called")
            //self.splash.resetSimulation()
            sceneTransition(initScene: self, nextScene: LoseScene())
        })
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
        
        //max vector to be applied for boost
        let regVector: CGFloat = 1000
        
        if currFi.waypoints.count < 2 || levelBeat || boostsRemaining == 0{
            return
        }
        
        let pointsCount = currFi.waypoints.count
        let point2 = currFi.waypoints[pointsCount-1]
        let point1 = currFi.waypoints[pointsCount-2]
        
        //1 Get vector for boost from fi.waypoints
        var vector = CGVector()
        vector.dx = point2.x > point1.x ? regVector : -regVector
        vector.dy = point2.y > point1.y ? regVector : -regVector
        
        print("applying boost")
        //2 Apply boost
        playZoomSound()
        boostsRemaining -= 1
        boostNumbLabel.text = String(boostsRemaining)
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
    func removeSlide(){
        enumerateChildNodes(withName: "slide", using: {node, stop in
            node.removeFromParent()
        })
    }
    //draw slide from points array
    func drawLines() {
        print("draw lines method called")
        //1
        //removeSlide()
        
        //2
        //enumerateChildNodes(withName: "slide", using: {node, stop in
            //3
            //let slide = node as! SKShapeNode
            if let path = self.createPath(){
                
                let slide = Slide(name: "slide", path: path)
                slide.active = true
                self.addChild(slide)
                slides.append(slide)
                print("adding slide")
            }
        //})
    }
    
    //Coins Add, Update, Remove
    func addCoins(){
        
        for coin in coins {

            addChild(coin)
            
        }
        
    }
    func updateCoinCount(value: Int){
        //TODO save this new coin count in gameData
        coinCount += value
        coinsLabel.text = "Coins: \(coinCount)"
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
            playCoinSound()
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
        
        //fi hits the water
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == waterCategory && !fiTouchingSlide{
            
            if !levelBeat && !flagTouched{
                print("fi touched the water")
                splash = prepareSplash()
                splash.position = contactPoint
                splash.numParticlesToEmit = 10
                splash.alpha = 0.75
                splash.speed = 400
                self.addChild(splash)
            }
        }
        //fi touches a slide
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == slideCategory {
            print("fi touching slide")
            fiTouchingSlide = true
        }
        //fi gets a coin
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == coinCategory {
            print("Fi touched the coin")
            
            //Remove the coin in style
            removeCoinInStyle(node: secondBody.node!)
        }
        //fi hits the flag
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == flagCategory {
            print("Fi touched the flag")
            
            flagTouched = true
        }
    }
    //physics contact ended
    func didEnd(_ contact: SKPhysicsContact) {
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
        
        //fi stopped touching the water
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == waterCategory && !fiTouchingSlide{
            print("fi stopped touching water")
            splash.resetSimulation()
            
        }
        //fi stopped touching a slide
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == slideCategory {
            print("fi touching slide")
            fiTouchingSlide = false
        }
        //fi stopped touching the flag
        if firstBody.categoryBitMask == fiCategory && secondBody.categoryBitMask == flagCategory {
            print("Fi touched the flag")
            
            flagTouched = false
        }
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
            
            if backButton.contains(location){
                //go to game scene
                sceneTransition(initScene: self, nextScene: MapScene())
            }
            
        }
    }
    override func update(_ currentTime: TimeInterval) {
        //print("movement :\(currFi.isMoving)")
       
        if currFi.position.y < deviceHeight * 0.1 && !leveLostCalled {
            leveLostCalled = true
            loseLevel()
        }
        if !levelBeat {
            addPositionPoint(point: currFi.position)
        }
        
        if currFi.waypoints.count > 10 && flagTouched == false {
            currFi.isMoving = true
            
        }
            
    }

    
}
