//
//  GameScene.swift
//  Mathy Bird
//
//  Created by Andrew Espinosa on 8/18/19.
//  Copyright © 2019 Andrew Espinosa. All rights reserved.
//

import SpriteKit
import GameplayKit

class mathySoarsGameScene: SKScene, SKPhysicsContactDelegate {
    
    var playerIcon = SKSpriteNode()
    var objectOne = SKNode()
    var objectTwo = SKNode()
    var objectThree = SKNode()
    var background = SKSpriteNode()
    var timer = Timer()
    let backgroundImg = SKTexture(imageNamed: "bg.png")
    let questionAnswer = SKTexture(imageNamed: "backgroundQuestion.png")
    var scoreLabel = SKLabelNode()
    var score = 0
    let answerChoiceOne = SKLabelNode()
    let answerChoiceTwo = SKLabelNode()
    let answerChoiceThree = SKLabelNode()
    let ground = SKSpriteNode()
    var groundTest = SKSpriteNode()
    
    var beforeGameStart = 0
    var scoreCap = 0
    var x = 0
    var y = 0
    var answerChoiceVar = 0
    var answer = 0
    var answerDisplay = SKLabelNode()
    
    var gameOver = false
    var gameOverLabel = SKLabelNode()
    
    enum ColliderType: UInt32{
    
        case bird = 1
        case object = 2
        case objectTwo = 4
        case objectThree = 8
        case gap = 16
    
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
       
        if(gameOver == false){
            
            if(contact.bodyA.categoryBitMask == ColliderType.object.rawValue || contact.bodyB.categoryBitMask == ColliderType.object.rawValue){
                
                print("ObjectOne")
                
                if(answerChoiceOne.text == String(answer)){
                    
                    if(scoreCap == 0){
                        
                    scoreCap += 1
                    score += 1
                        
                    //coins.sharedInstance.coin += 1
                    }else{
                        
                        print("Lo Siento")
                        
                    }
                    
                    scoreLabel.text = String("\(score)")
                    
                }else if(answerChoiceOne.text != String(answer)){
                    
                    self.speed = 0
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    gameOver = true
                    gameOver = true
                    gameOverLabel.fontName = "Marker Felt Thin"
                    gameOverLabel.fontSize = 30
                    gameOverLabel.text = "Game Over! Tap to play again!"
                    gameOverLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                    self.addChild(gameOverLabel)
                    timer.invalidate()
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    
                }
                
            }
            
            if(contact.bodyA.categoryBitMask == ColliderType.objectTwo.rawValue || contact.bodyB.categoryBitMask == ColliderType.objectTwo.rawValue){
                
                print("ObjectTwo")
                
                if(answerChoiceTwo.text == String(answer)){
                    
                    if(scoreCap == 0){
                        
                        scoreCap += 1
                        score += 1
                        
                       // coins.sharedInstance.coin += 1
                    }else{
                        
                        print("Lo Siento")
                        
                    }
                    
                    scoreLabel.text = String("\(score)")
                    
                }else if(answerChoiceTwo.text != String(answer)){
                    
                    self.speed = 0
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    gameOver = true
                    gameOver = true
                    gameOverLabel.fontName = "Marker Felt Thin"
                    gameOverLabel.fontSize = 30
                    gameOverLabel.text = "Game Over! Tap to play again!"
                    gameOverLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                    self.addChild(gameOverLabel)
                    timer.invalidate()
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    
                }
            }
            
            if(contact.bodyA.categoryBitMask == ColliderType.objectThree.rawValue || contact.bodyB.categoryBitMask == ColliderType.objectThree.rawValue){
                
                print("ObjectThree")
                
                if(answerChoiceThree.text == String(answer)){
                    
                    if(scoreCap == 0){
                        
                        scoreCap += 1
                        score += 1
                        
                       // coins.sharedInstance.coin += 1
                    }else{
                        
                        print("Lo Siento")
                        
                    }
                    
                    scoreLabel.text = String("\(score)")
                    print("\(answerChoiceThree.text! ) = \(answer)")

                }else if(answerChoiceThree.text != String(answer)){
                    
                    self.speed = 0
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    gameOver = true
                    gameOver = true
                    gameOverLabel.fontName = "Marker Felt Thin"
                    gameOverLabel.fontSize = 30
                    gameOverLabel.text = "Game Over! Tap to play again!"
                    gameOverLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                    self.addChild(gameOverLabel)
                    timer.invalidate()
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    
                }
                
            }
                if(contact.bodyA.categoryBitMask == ColliderType.gap.rawValue || contact.bodyB.categoryBitMask == ColliderType.gap.rawValue){
                    
                    self.speed = 0
                    gameOver = true
                    gameOver = true
                    gameOverLabel.fontName = "Marker Felt Thin"
                    gameOverLabel.fontSize = 30
                    gameOverLabel.text = "Game Over! Tap to play again!"
                    gameOverLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                    self.addChild(gameOverLabel)
                    timer.invalidate()
                    UserDefaults.standard.set(score, forKey: "scoreSave")
                    //shop.shopSharedInstance.shopContent = UserDefaults.standard.object(forKey: "shopSave") as! [Bool]
                    
                }
            
        }
        
        
    }
    
    @objc func makeQuestions (){
        
        //Object One
 
        let objectOneVelocity = SKAction.move(by: CGVector(dx: -2 * self.frame.width, dy: 0), duration: TimeInterval(self.frame.width / 50))
        let objectOneShift = SKAction.move(by: CGVector(dx: questionAnswer.size().width, dy: 0), duration: 0)
        let objectOneChange = SKAction.repeatForever(SKAction.sequence([objectOneVelocity, objectOneShift]))
        
        
        objectOne = SKSpriteNode(texture: questionAnswer)
        objectOne.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y: self.frame.maxY - 200)
        objectOne.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.questionAnswer.size().width, height: self.questionAnswer.size().height))
        objectOne.run(objectOneChange)
        
        objectOne.physicsBody!.isDynamic = false
        objectOne.physicsBody!.contactTestBitMask = ColliderType.object.rawValue
        objectOne.physicsBody!.categoryBitMask = ColliderType.object.rawValue
        objectOne.physicsBody!.collisionBitMask = ColliderType.object.rawValue
        objectOne.zPosition = -2
        addChild(objectOne)
        
        objectTwo = SKSpriteNode(texture: questionAnswer)
        objectTwo.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y: self.frame.midY)
        objectTwo.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.questionAnswer.size().width, height: self.questionAnswer.size().height))
        
        objectTwo.physicsBody!.isDynamic = false
        objectTwo.run(objectOneChange)
        
        objectTwo.physicsBody!.contactTestBitMask = ColliderType.objectTwo.rawValue
        objectTwo.physicsBody!.categoryBitMask = ColliderType.objectTwo.rawValue
        objectTwo.physicsBody!.collisionBitMask = ColliderType.objectTwo.rawValue
        objectTwo.zPosition = -2
        addChild(objectTwo)
        
        objectThree = SKSpriteNode(texture: questionAnswer)
        objectThree.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y: -self.frame.maxY + 200)
        objectThree.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.questionAnswer.size().width, height: self.questionAnswer.size().height))
        objectThree.physicsBody!.isDynamic = false
        objectThree.run(objectOneChange)
        
        objectThree.physicsBody!.contactTestBitMask = ColliderType.objectThree.rawValue
        objectThree.physicsBody!.categoryBitMask = ColliderType.objectThree.rawValue
        objectThree.physicsBody!.collisionBitMask = ColliderType.objectThree.rawValue
        objectThree.zPosition = -2
        addChild(objectThree)
        
        x = Int(arc4random_uniform(12))
        y = Int(arc4random_uniform(12))
        answer = Int(x + y)
        
        answerDisplay.fontName = "Marker Felt Thin"
        answerDisplay.fontSize = 50
        answerDisplay.text = String("\(x) + \(y) =")
        answerDisplay.position = CGPoint(x: frame.midX, y: self.frame.maxY - 150)
        
        answerChoiceVar = Int(arc4random_uniform(3))
        
        
        if(answerChoiceVar == 0){
            
            answerChoiceOne.text = String(answer)
            answerChoiceTwo.text = String(answer - 1)
            answerChoiceThree.text = String(answer + 1)
            
        }else if(answerChoiceVar == 1){
            
            answerChoiceOne.text = String(answer-1)
            answerChoiceTwo.text = String(answer)
            answerChoiceThree.text = String(answer + 1)
            
        }else if(answerChoiceVar == 2){
            
            answerChoiceOne.text = String(answer + 1)
            answerChoiceTwo.text = String(answer - 1)
            answerChoiceThree.text = String(answer)
            
        }
        
        answerChoiceOne.fontName = "Marker Felt Thin"
        answerChoiceOne.fontSize = 50
        answerChoiceOne.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y:  self.frame.maxY - 200)
        
        answerChoiceTwo.fontName = "Marker Felt Thin"
        answerChoiceTwo.fontSize = 50
        answerChoiceTwo.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y:  self.frame.midY)
        
        answerChoiceThree.fontName = "Marker Felt Thin"
        answerChoiceThree.fontSize = 50
        answerChoiceThree.position = CGPoint(x: self.frame.midX + backgroundImg.size().width / 2, y:  -self.frame.maxY + 200)
        
        
        print(answerChoiceVar)
        answerChoiceOne.zPosition = -1
        answerChoiceTwo.zPosition = -1
        answerChoiceThree.zPosition = -1
        
        scoreCap = 0
        
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        gameSetUp()
        answerDisplay.zPosition = -1
        
        let objectOneVelocity = SKAction.move(by: CGVector(dx: -2 * self.frame.width, dy: 0), duration: TimeInterval(self.frame.width / 50))
        let objectOneShift = SKAction.move(by: CGVector(dx: questionAnswer.size().width, dy: 0), duration: 0)
        let objectOneChange = SKAction.repeatForever(SKAction.sequence([objectOneVelocity, objectOneShift]))
        
        answerChoiceOne.run(objectOneChange)
        answerChoiceTwo.run(objectOneChange)
        answerChoiceThree.run(objectOneChange)
       // print("Hello There")
        
    }
    
    
    func gameSetUp(){
        
      //  if(shop.shopSharedInstance.shopContent[0] == true){
            
        //    shop.shopSharedInstance.shopContent[0] = false
          //  playerIcon.physicsBody!.contactTestBitMask = 128
            
        //}
        
        
        //Background
        let objectOneVelocity = SKAction.move(by: CGVector(dx: -2 * self.frame.width, dy: 0), duration: TimeInterval(self.frame.width / 50))
        let objectOneShift = SKAction.move(by: CGVector(dx: questionAnswer.size().width, dy: 0), duration: 0)
        let objectOneChange = SKAction.repeatForever(SKAction.sequence([objectOneVelocity, objectOneShift]))
        
        let backgroundMove = SKAction.move(by: CGVector(dx: -backgroundImg.size().width, dy: 0), duration: 7)
        let backgroundShift = SKAction.move(by: CGVector(dx: backgroundImg.size().width, dy: 0), duration: 0)
        let backgroundChange = SKAction.repeatForever(SKAction.sequence([backgroundMove, backgroundShift]))
        
        var i: CGFloat = 0
        while i < 3{
            background = SKSpriteNode(texture: backgroundImg)
            background.zPosition = -4
            background.position = CGPoint(x: backgroundImg.size().width * i, y: self.frame.midY)
            background.size.height = self.size.height
            
            background.run(backgroundChange)
            self.addChild(background)
            
            i += 1
        }
        
        //ground
        
        let groundTexture = SKTexture(imageNamed: "backgroundQuestion")
        groundTest = SKSpriteNode(texture: groundTexture)
        groundTest.position = CGPoint(x: self.frame.midX, y: 100 + -self.frame.maxY)
        groundTest.size.height = 10
        groundTest.size.width = 10000
        groundTest.zRotation = 0
        groundTest.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: groundTest.size.width, height: groundTest.size.height))
        groundTest.physicsBody!.isDynamic = false
        groundTest.physicsBody!.contactTestBitMask = ColliderType.bird.rawValue
        groundTest.physicsBody!.categoryBitMask = ColliderType.gap.rawValue
        groundTest.physicsBody!.collisionBitMask = ColliderType.gap.rawValue
        
        groundTest.zPosition = 4
        addChild(groundTest)
        
        // player
        let birdTexture = SKTexture(imageNamed: "150x111Taffy.png")
        let birdTexture2 = SKTexture(imageNamed: "150x111Taffy22.png")
        
        let animation = SKAction.animate(with: [birdTexture, birdTexture2], timePerFrame: 0.2)
        let makesBirdFlap = SKAction.repeatForever(animation)
        
        playerIcon = SKSpriteNode(texture: birdTexture)
        playerIcon.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        playerIcon.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
        playerIcon.physicsBody!.isDynamic = false
        playerIcon.run(makesBirdFlap)
        
        playerIcon.physicsBody!.contactTestBitMask = ColliderType.object.rawValue + ColliderType.objectTwo.rawValue + ColliderType.objectThree.rawValue
        playerIcon.physicsBody!.categoryBitMask = ColliderType.bird.rawValue
        playerIcon.physicsBody!.collisionBitMask = ColliderType.bird.rawValue
        playerIcon.zPosition = 0
        addChild(playerIcon)
        
        scoreLabel.fontName = "Marker Felt Thin"
        scoreLabel.fontSize = 50
        scoreLabel.text = String(score)
        scoreLabel.position = CGPoint(x: self.frame.midX, y: -self.frame.maxY + 150)
        addChild(scoreLabel)
        
        
        addChild(answerDisplay)
        addChild(answerChoiceOne)
        addChild(answerChoiceTwo)
        addChild(answerChoiceThree)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        beforeGameStart += 1
        
        if beforeGameStart == 1 {
            
            timer = Timer.scheduledTimer(timeInterval: 8.5, target: self, selector: #selector(self.makeQuestions), userInfo: nil, repeats: true)
            
            makeQuestions()
            
        }
        
        if gameOver == false{
            
        playerIcon.physicsBody!.isDynamic = true
        playerIcon.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
        playerIcon.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 55))
            
        }else{
            
            beforeGameStart = 0
            gameOver = false
            score = 0
            scoreLabel.text = String(0)
            self.removeAllChildren()
            self.speed = 1
            gameSetUp()
            
            
        }
        

        }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
