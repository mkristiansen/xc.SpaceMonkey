//
//  GameScene.swift
//  SpaceMonkey
//
//  Created by Main Account on 4/10/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1 - Create the sprite
    let player = SKSpriteNode(imageNamed:"spacemonkey_fly02")
    
    override func didMoveToView(view: SKView) {
        
        // 2 - Position the sprite
        player.position = CGPoint(x:frame.size.width * 0.1, y: frame.size.height * 0.5)
        // 3 - Add the sprite to the scene
        addChild(player)
        
        // 4 - Set scene background color to black
        backgroundColor = SKColor.blackColor()
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(createEnemy),
                SKAction.waitForDuration(1.0)])))
        
        player.physicsBody = SKPhysicsBody(circleOfRadius:player.frame.size.width * 0.3)
        player.physicsBody?.allowsRotation = false
        
        let collisionFrame = CGRectInset(frame, 0, -self.size.height * 0.2)
        physicsBody = SKPhysicsBody(edgeLoopFromRect: collisionFrame)
    }
 
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    // 1
    func createEnemy() {
        // 2
        let enemy = SKSpriteNode(imageNamed: "boss_ship")
        // 3
        enemy.name = "enemy"
        // 4
        enemy.position = CGPoint(x: frame.size.width + enemy.size.width/2,
                                 y: frame.size.height * random(0, max: 1))        // 5
        addChild(enemy)
        
        enemy.runAction(
            SKAction.moveByX(-size.width - enemy.size.width, y: 0.0,
                duration: NSTimeInterval(random(1, max: 2))))
    }
    
    func jumpPlayer() {
        // 1
        let impulse =  CGVector(dx: 0, dy: 120)
        // 2
      player.physicsBody?.applyImpulse(impulse)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        jumpPlayer()
    }
}