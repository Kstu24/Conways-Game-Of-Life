//
//  ConwaysGridView.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/15/20.
//
import Foundation
import SpriteKit

class ConwaysGridView: SKScene {
    
    // Properties
    var touchEnabled: Bool = true
    var gridArray: [Node] = []
    
    // To do list
    // create a custom cell
    // create a current state/next state
    // change generation label to a skscene with the grid view to help update the gen counter
    // fix outter nodes so that they are the same size
    
    override func didMove(to view: SKView) {
        let cellCount = 20
        let cellSize = CGFloat(view.frame.height / 20)
        
        for y in 0..<cellCount {

            for x in 0..<cellCount {
//                let node = SKShapeNode(rect: CGRect(x: 0, y: 0, width: cellSize, height: cellSize))
                let node = Node(currentState: .dead, rectSize: CGSize(width: cellSize, height: cellSize))
                node.position = CGPoint(x: (CGFloat(x) * cellSize), y: (CGFloat(y) * cellSize))
                print("x should be at \(CGFloat(x) * cellSize)")
                print("x should be at \(CGFloat(y) * cellSize)")
                node.fillColor = .black
                self.backgroundColor = .orange
                print("\(x),\(y)")
                self.addChild(node)
                // TODO: Add cell coordinates
                gridArray.append(node)
            }

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                if let node = atPoint(location) as? Node {
                    print("tapped node at a location")
                    if touchEnabled {
                        if node.currentState == .dead {
                            print("tapped was dead, now alive")
                            node.currentState = .alive
                            node.fillColor = .yellow
                        } else {
                            print("tapped was alive, now dead")
                            node.currentState = .dead
                            node.fillColor = .black
                        }
//                        node.fillColor = .yellow
//                        print(node.currentState)
//                        let systemSoundID: SystemSoundID = 1104
//                        AudioServicesPlaySystemSound (systemSoundID)
                    }
                }
                print("location.x = \(location.x), location.y = \(location.y)")
            }
        }
}
