//
//  GameViewController.swift
//  Mathy Bird
//
//  Created by Andrew Espinosa on 8/18/19.
//  Copyright © 2019 Andrew Espinosa. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    //let scene = GameScene(size: view.bounds.size)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
                  // Load the SKScene from 'GameScene.sks'
                  if let scene = SKScene(fileNamed: "GameScene") {
                      // Set the scale mode to scale to fit the window
                      scene.scaleMode = .aspectFill
                      
                      // Present the scene
                  }
            let scene = GameScene(size: CGSize(width: self.view.bounds.width + 300, height: self.view.bounds.height + 300))
                view.presentScene(scene)
                  view.ignoresSiblingOrder = true
                  
                  view.showsFPS = false
                  view.showsNodeCount = false
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
