//
//  CustomGridCell.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/16/20.
//

import UIKit
import SpriteKit

class Node: SKShapeNode {
    
    enum CurrentState {
        case alive
        case dead
    }

    var x: Int = 0
    var y: Int = 0
    var currentState: CurrentState = .dead
//    var currentStateColor: UIColor
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(x: Int, y: Int, currentState: CurrentState = .dead) {
        self.x = x
        self.y = y
        self.currentState = currentState
//        self.currentState = fillColor
        super.init()
    }
    
    init(currentState: CurrentState, rectSize: CGSize) {
        super.init()
        let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: rectSize.width, height: rectSize.height))
        self.path = CGPath(rect: shape.frame, transform: nil)
        self.fillColor = .black
        self.currentState = currentState
    }
}
