//
//  GameScene.swift
//  Loot Collector
//
//  Created by Ryan Thomas on 12/17/19.
//  Copyright © 2019 Ryan Thomas. All rights reserved.
//

//let is constant
//var is variable

import SpriteKit
import GameplayKit


var scoreNumber = 0
let defaults = UserDefaults()
var highScoreNumber = defaults.integer(forKey: "highScoreSaved")



class GameScene: SKScene {
    var spawning = true
    var spawning2 = true
    var spawning3 = true
    var spawning4 = true
    
    let scoreLabel = SKLabelNode(fontNamed: "Brutals")
    
    let playCorrectSoundEffect = SKAction.playSoundFileNamed("Correct2.mp3", waitForCompletion: false)
    
    let playGameOverSoundEffect = SKAction.playSoundFileNamed("GameOverSound.wav", waitForCompletion: false)
    
    let playBombSoundEffect = SKAction.playSoundFileNamed("Bombsound.mp3", waitForCompletion: false)
    let MissCircle = SKAction.playSoundFileNamed("MissCircle.mp3", waitForCompletion: false)
    
    
    
    let gameArea: CGRect
    
    override init(size: CGSize) {
        
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 250, width: playableWidth, height: size.height - 200)
        //Setting up a game area so nothing can spawn outside of that area
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
    
    //code for background and first disc to appear
    override func didMove(to view: SKView) { //Runs as soon as moved into scene
        
        let highScoreLabel = SKLabelNode(fontNamed: "Brutals")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 35
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2 - 290 , y: self.size.height*0.94)
        self.addChild(highScoreLabel)
        
        scoreNumber = 0
        
        //let to declare something new
        //SPSpritenode = picture
        
        var randomBackgroundNumber = arc4random()%3
        randomBackgroundNumber += 1
        let background = SKSpriteNode(imageNamed: "Background\(randomBackgroundNumber).jpg") //SkSpriteNode is for images
        background.size = self.size //set size to size of the scene
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let disc = SKSpriteNode(imageNamed: "Circle1")
        disc.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        disc.zPosition = 2
        disc.name = "discObject"
        self.addChild(disc)
        
        scoreLabel.fontSize = 150
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.87)
        self.addChild(scoreLabel)
        
        
    }
    
    
    
    
    func spawnNewDisc(){
        
        var randomImageNumber = arc4random()%4
        randomImageNumber += 1
        
        let disc = SKSpriteNode(imageNamed: "Circle\(randomImageNumber)")
        disc.zPosition = 2
        disc.name = "discObject"
        
        let randomX = random(min: gameArea.minX + disc.size.width/2, max: gameArea.maxX - disc.size.width/2)
        
        let randomY = random(min: gameArea.minY + disc.size.height/2, max: gameArea.maxY - disc.size.height/2)
        
        disc.position = CGPoint(x: randomX, y: randomY)
        
        self.addChild(disc)
        
        disc.run(SKAction.sequence([SKAction.scale(to: 0, duration: 4),
                                    playGameOverSoundEffect,
                                    SKAction.run(runGameOver)]))
    }
    
    
    
    
    
    func spawnGold(){
        let gold = SKSpriteNode(imageNamed: "gold")
        gold.name = "goldObject"
        
        let randomX = random(min: gameArea.minX + gold.size.width/2, max: gameArea.maxX - gold.size.width/2) //Can go farthest point on the X axis
        
        let randomY = random(min: gameArea.minY + gold.size.height/2, max: gameArea.maxY - gold.size.height/2)
        
        gold.position = CGPoint(x: randomX, y: randomY)
        
        self.addChild(gold)
        
        gold.run(SKAction.sequence([ //a sequence needs to be made up of actions
            SKAction.scale(to: 0, duration: 3),
        ]))
        
    }
    
    func spawnBomb(){
        let bomb = SKSpriteNode(imageNamed: "bomb")
        bomb.name = "bombObject"
        
        let randomX = random(min: gameArea.minX + bomb.size.width/2, max: gameArea.maxX - bomb.size.width/2) //Can go farthest point on the X axis
        
        let randomY = random(min: gameArea.minY + bomb.size.height/2, max: gameArea.maxY - bomb.size.height/2)
        
        bomb.position = CGPoint(x: randomX, y: randomY)
        
        self.addChild(bomb)
        
        bomb.run(SKAction.sequence([ //a sequence needs to be made up of actions
            SKAction.scale(to: 0, duration: 3)
        ]))
        
    }
    
    
    func runGameOver(){
        
        //here we will code game over
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
    }
    

    func keepScore(){

        if spawning == true{
        if scoreNumber >= 10 {
            spawnNewDisc()
            spawning = false
            }
        }
        if spawning2 == true{
        if scoreNumber >= 35{
            spawnNewDisc()
            spawning2 = false
        }
        }
        
        if spawning3 == true{
        if scoreNumber >= 125{
            spawnNewDisc()
            spawning3 = false
        }
        }
        
        
        if spawning4 == true{
        if scoreNumber >= 175{
            spawnNewDisc()
            spawning4 = false
        }
        }
    }
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // run when touching the screen
        
        keepScore()
        
        let randomgold = Int.random(in: scoreNumber...scoreNumber + 4)
        let randombomb = Int.random(in: scoreNumber...scoreNumber + 5)
        
    
        for touch: AnyObject in touches{

            let positionOfTouch = touch.location(in: self) //Holds poisition user touches the screen
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name //holds name of oobject that user has touched
            
            
            if nameOfTappedNode == "discObject"{
                //tappedNode.removeFromParent() //Removes disk
                if scoreNumber == randomgold{
                    spawnGold()
                }
                
                if scoreNumber == randombomb{
                    spawnBomb()
                }
                
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                ]))
                
                self.run(playCorrectSoundEffect)
                
                
                spawnNewDisc()
                
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)" // Makes scoreLabel = to the varoable scoreNumber
                
                
            
                
            }
            else if nameOfTappedNode == "goldObject"{
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    ]))
                self.run(playCorrectSoundEffect)
                scoreNumber += 5
                scoreLabel.text = "\(scoreNumber)"
                
            }
                
            else if nameOfTappedNode == "bombObject"{
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    ]))
                self.run(playBombSoundEffect)
                scoreNumber = scoreNumber / 2
                scoreLabel.text = "\(scoreNumber)"
                
            }
                
        
            else if nameOfTappedNode != "discObject"{
                self.run(MissCircle)
                scoreNumber -= 1
                scoreLabel.text = "\(scoreNumber)"
            }
            
    }
        
        if scoreNumber > highScoreNumber{
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
  
}

}
