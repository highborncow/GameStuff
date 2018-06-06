//
//  Utils.swift
//  GameStuff
//
//  Created by Augusto Avelino on 05/06/18.
//  Copyright © 2018 Augusto Avelino. All rights reserved.
//

import SpriteKit

func *(left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx * right, dy: left.dy * right)
}
func /(left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx / right, dy: left.dy / right)
}

extension CGRect {
    
    var midPoint: CGPoint {
        return CGPoint(x: width / 2, y: height / 2)
    }
}
