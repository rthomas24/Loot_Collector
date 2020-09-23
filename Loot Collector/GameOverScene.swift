//
//  GameOverScene.swift
//  Loot Collector
//
//  Created by Ryan Thomas on 12/17/19.
//  Copyright © 2019 Ryan Thomas. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    
    let clickSound = SKAction.playSoundFileNamed("click2.mp3", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "Endscreen.jpg")
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Brutals")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 100
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "Brutals")
        finalScoreLabel.text = "Score \(scoreNumber)"
        finalScoreLabel.fontSize = 70
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        finalScoreLabel.fontColor = SKColor.white
        finalScoreLabel.zPosition = 1
        self.addChild(finalScoreLabel)
        
        
        let restartLabel = SKLabelNode(fontNamed: "Brutals")
        restartLabel.text = "Restart"
        restartLabel.fontSize = 75
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restartLabel.name = "restartButton"
        self.addChild(restartLabel)
        
        let exitLabel = SKLabelNode(fontNamed: "Brutals")
        exitLabel.text = "Exit"
        exitLabel.fontSize = 75
        exitLabel.fontColor = SKColor.white
        exitLabel.zPosition = 1
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            
            let pointofTouch = touch.location(in: self)
            
            let tappedNode = atPoint(pointofTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "restartButton"{
                self.run(clickSound)
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
                
            }
            
            if tappedNodeName == "exitButton"{
                self.run(clickSound)

                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
        }
    }
    
}
