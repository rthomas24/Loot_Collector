//
//  MainMenuScene.swift
//  Loot Collector
//
//  Created by Ryan Thomas on 12/17/19.
//  Copyright © 2019 Ryan Thomas. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
    let playsound = SKAction.playSoundFileNamed("click2.mp3", waitForCompletion: false)
    
    
    override func didMove(to view: SKView) {
        let mainBackground = SKSpriteNode(imageNamed: "MainMenucopy.jpg")
        mainBackground.size = self.size
        mainBackground.zPosition = 0
        mainBackground.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(mainBackground)
        
        
        let title1 = SKLabelNode(fontNamed: "Brutals")
        title1.text = "Loot Collecter"
        title1.fontSize = 130
        title1.fontColor = SKColor.black
        title1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        title1.zPosition = 1
        self.addChild(title1)
        
        let instructions1 = SKLabelNode(fontNamed: "Brutals")
        instructions1.text = "Collect all the circles and loot!"
        instructions1.fontSize = 55
        instructions1.fontColor = SKColor.black
        instructions1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        instructions1.zPosition = 1
        self.addChild(instructions1)
        
        let instructions2 = SKLabelNode(fontNamed: "Brutals")
        instructions2.text = "Avoid the bombs or else your score will be cut in half!"
        instructions2.fontSize = 38
        instructions2.fontColor = SKColor.black
        instructions2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.12)
        instructions2.zPosition = 1
        self.addChild(instructions2)
        
        let startGame = SKLabelNode(fontNamed: "Brutals")
        startGame.text = "Start Game"
        startGame.fontSize = 130
        startGame.fontColor = SKColor.blue
        startGame.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        startGame.zPosition = 1
        startGame.name = "startGame"
        self.addChild(startGame)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touchAnyObject in touches{
            let touchPoint = touchAnyObject.location(in: self)
            let tappedNode = atPoint(touchPoint)
            
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "startGame"{
                self.run(playsound)
                
                let scenceToMoveTo = GameScene(size: self.size)
                scenceToMoveTo.scaleMode = self.scaleMode
                let sceneTranisition = SKTransition.fade(withDuration: 0.2)
                self.view!.presentScene(scenceToMoveTo, transition: sceneTranisition)
                
            }
        }
    }
    
}
