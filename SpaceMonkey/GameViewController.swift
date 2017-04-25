//
//  GameViewController.swift
//  SpaceMonkey
//
//  Created by Main Account on 4/10/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit
import SpriteKit
 
import AVFoundation
 
class GameViewController: UIViewController {
 
  override func viewWillLayoutSubviews() {
    super.viewDidLoad()
 
    let skView = self.view as! SKView
    if skView.scene == nil {
 
      let scene = GameScene(size:skView.frame.size)
      skView.showsFPS = true
      skView.showsNodeCount = true
      skView.showsPhysics = true
      skView.ignoresSiblingOrder = true
      scene.scaleMode = .AspectFill
      skView.presentScene(scene)
 
    }
  }
 
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}