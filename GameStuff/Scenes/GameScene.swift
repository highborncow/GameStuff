//
//  GameScene.swift
//  GameStuff
//
//  Created by Augusto Avelino on 05/06/18.
//  Copyright © 2018 Augusto Avelino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // MARK: Properties
    let joystick: Joystick
    let character = SKShapeNode(circleOfRadius: 30)
    let characterSpeed: CGFloat = 5.0
    
    // MARK:- Initializers
    override init(size: CGSize) {
        joystick = Joystick()
        super.init(size: size)
        character.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(character)
        addChild(joystick)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Methods
    
    // MARK: Overrides
    override func update(_ currentTime: TimeInterval) {
        
        // An example of a joystick being used
        if joystick.direction != .zero {
            character.run(.move(by: joystick.direction * characterSpeed, duration: 0.1))
        }
    }
}
