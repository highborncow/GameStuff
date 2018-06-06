//
//  Joystick.swift
//  GameStuff
//
//  Created by Augusto Avelino on 05/06/18.
//  Copyright © 2018 Augusto Avelino. All rights reserved.
//

import SpriteKit

class Joystick: SKShapeNode {
    
    // MARK: Properties
    let radius: CGFloat
    var direction: CGVector {
        guard let control = childNode(withName: "control") else { return .zero }
        return CGVector(dx: control.position.x / radius, dy: control.position.y / radius)
    }
    var activeTouch: UITouch?
    
    // MARK:- Initializers
    init(centeredAt center: CGPoint = CGPoint(x: 65, y: 65), withRadius aRadius: CGFloat = 50) {
        radius = aRadius
        let control = SKShapeNode(circleOfRadius: radius * 3/5)
        control.name = "control"
        super.init()
        addChild(control)
        path = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true).cgPath
        position = center
        control.position = .zero
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Methods
    
    // MARK: Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let control = childNode(withName: "control") else { return }
        let location = touch.location(in: self)
        if activeTouch == nil {
            activeTouch = touch
        }
        control.position = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let scene = parent as? SKScene, let touch = activeTouch, let control = childNode(withName: "control") else { return }
        let sceneLocation = touch.location(in: scene)
        let location = touch.location(in: self)
        if contains(sceneLocation) {
            control.position = location
        } else {
            let dist = CGFloat(distance(double2(Double(sceneLocation.x), Double(sceneLocation.y)), double2(Double(position.x), Double(position.y))))
            let x = sceneLocation.x - position.x
            let y = sceneLocation.y - position.y
            control.position = CGPoint(x: radius * (x / dist), y: radius * (y / dist))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let control = childNode(withName: "control") {
            control.position = .zero
        }
        activeTouch = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let control = childNode(withName: "control") {
            control.position = .zero
        }
        activeTouch = nil
    }
}
