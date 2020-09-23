//
//  GameViewController.swift
//  Loot Collector
//
//  Created by Ryan Thomas on 12/17/19.
//  Copyright © 2019 Ryan Thomas. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048)) //Makes game size universal with any type of machine
        
            if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
               // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
