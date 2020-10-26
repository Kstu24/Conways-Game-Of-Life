//
//  ConwaysGridView.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/15/20.
//
import Foundation
import SpriteKit
import SwiftUI

// Create bounds using the coordinates so outside nodes don't exist (0,0 - 19,19)
// Create an array for each row in grid view to help call as coordinates

class ConwaysGridView: SKScene {
    
    // MARK: - Properties
    var touchEnabled: Bool = true
    var gridArray: [Node] = []
    var generationBool: Bool = false
    let gridSize = 25
    var generationCounter = 0 {
            // Send notification every time generation count is changed to update label in VC
            didSet {
                // Step 4
                NotificationCenter.default.post(name: .updateGenLabel,
                object: self)
            }
        }
    // MARK: - Methods
    func changeColor() {
        for x in gridArray {
            x.colorChange.toggle()
        }
    }
    
    func indexForCoordinate(x: Int, y: Int) -> Int {
        let nodeIndex = ((x) + (y * gridSize))
        return nodeIndex
    }
    
    // Draws grid view and appends nodes to grid array
    override func didMove(to view: SKView) {
        var indexCounter = 0
        let cellCount = gridSize
        let cellSize = CGFloat(view.frame.height / 25)
        
        for y in 0..<cellCount {
            
            for x in 0..<cellCount {
                let node = Node(currentState: .dead, rectSize: CGSize(width: cellSize, height: cellSize))
                node.position = CGPoint(x: (CGFloat(x) * cellSize), y: (CGFloat(y) * cellSize))
                node.fillColor = .black
                node.x = x
                node.y = y
                node.index = indexCounter
                indexCounter += 1
                self.addChild(node)
                gridArray.append(node)
            }
        }
    }
    
    // Allows user to tap on the grid and toggle alive and dead nodes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let node = atPoint(location) as? Node {
                if touchEnabled {
                    if node.currentState == .dead {
                        node.currentState = .alive
                    } else {
                        node.currentState = .dead
                    }
                }
            }
        }
    }
    
    func checkNeighbor(node: Node) {
        
        // cardinal directions
        let rightNeighbor = (x: node.x + 1, y: node.y, currentState: node.currentState)
        let leftNeighbor = (x: node.x - 1, y: node.y, currentState: node.currentState)
        let topNeighbor = (x: node.x, y: node.y + 1, currentState: node.currentState)
        let bottomNeighbor = (x: node.x, y: node.y - 1, currentState: node.currentState)
        
        // diagonal directions
        let topRightNeighbor = (x: node.x + 1, y: node.y + 1, currentState: node.currentState)
        let topLeftNeighbor = (x: node.x - 1, y: node.y + 1, currentState: node.currentState)
        let bottomLeftNeighbor = (x: node.x - 1, y: node.y - 1, currentState: node.currentState)
        let bottomRightNeighbor = (x: node.x + 1, y: node.y - 1, currentState: node.currentState)
        
        // Array that holds all directions: Loop through to check neighbors currentState
        let neighborNodesHolder = [rightNeighbor, leftNeighbor, topNeighbor, bottomNeighbor, topRightNeighbor, topLeftNeighbor, bottomLeftNeighbor, bottomRightNeighbor]
        // Loops through neighborNodes and filters out nodes with coordinates outside the bounds of the grid
        let neighborNodesInBounds = neighborNodesHolder.filter { $0.x >= 0 && $0.x <= 24 && $0.y >= 0 && $0.y <= 24 }
        
        var liveCount = 0
        for x in neighborNodesInBounds {
            let node = gridArray[indexForCoordinate(x: x.x, y: x.y)]
            if node.currentState == .alive {
                liveCount += 1
            }
        }
        
        if node.currentState == .alive {
            if liveCount == 2 || liveCount == 3 {
                node.nextState = .alive
            } else {
                node.nextState = .dead
            }
        } else {
            if liveCount == 3 {
                node.nextState = .alive
            } else {
                node.nextState = .dead
            }
        }
    }
    
    // MARK: - Iteration methods
    // Clears board by setting all live nodes currentState equal to dead
    func clearBoard() {
        for i in gridArray {
            i.currentState = .dead
        }
        generationCounter = 0
    }
    
    // Works its way through the generations
    func playGame() {
        touchEnabled = false
        let sequence = SKAction.sequence([
            SKAction.run(advanceOneStep),
            SKAction.wait(forDuration: 0.2)
        ])
        let action = SKAction.repeatForever(sequence)
        run(action)
    }
    
    // Advances the generation by one instead of looping
    func advanceOneStep() {
        for node in gridArray {
            checkNeighbor(node: node)
        }
        for x in gridArray {
            x.currentState = x.nextState
        }
        generationCounter += 1
    }
    
    /// Removes all actions from scene
    func stopLoop() {
        touchEnabled = true
        self.removeAllActions()
    }
    
    // MARK: - Preset methods
    
    func beacon() {
        clearBoard()
        gridArray[indexForCoordinate(x: 9, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 9, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 8, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 8, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 9)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 8)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 9)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 8)].currentState = .alive
    }
    
    func blinker() {
        clearBoard()
        gridArray[indexForCoordinate(x: 10, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 9)].currentState = .alive
    }
    
    func glider() {
        clearBoard()
        gridArray[indexForCoordinate(x: 10, y: 9)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 9, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 11)].currentState = .alive
    }
    
    func toad() {
        clearBoard()
        gridArray[indexForCoordinate(x: 9, y: 9)].currentState = .alive
        gridArray[indexForCoordinate(x: 8, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 8, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 10)].currentState = .alive
        gridArray[indexForCoordinate(x: 11, y: 11)].currentState = .alive
        gridArray[indexForCoordinate(x: 10, y: 12)].currentState = .alive
    }
}

