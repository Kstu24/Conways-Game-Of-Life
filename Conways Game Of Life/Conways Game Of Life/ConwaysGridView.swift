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
    var liveNodes: [Node] = []
    var generationBool: Bool = false
    let gridSize = 20
    
    // Block properties
    
    
    // MARK: - Methods
    
    // Generation Counter
    func addGeneration() -> Int {
        var generationCounter = 0
        while generationBool == true {
            generationCounter += 1
        }
        return generationCounter
    }
    
    // Adds live nodes to live nodes array
    func addLiveNodes(node: Node) {
        liveNodes.append(node)
    }
    
    // Removes dead nodes from live nodes array
    func removeDeadNodes() {
//        let deadNodes = liveNodes.filter { $0.currentState == .dead }
//        liveNodes.remove(at: deadNodes.count) // fatal error happens here when there are only two or less nodes that are alive
    }
    
    // Draws grid view and appends nodes to grid array
    override func didMove(to view: SKView) {
        var indexCounter = 0
        let cellCount = 20
        let cellSize = CGFloat(view.frame.height / 20)
        
        for y in 0..<cellCount {
            
            for x in 0..<cellCount {
                let node = Node(currentState: .dead, rectSize: CGSize(width: cellSize, height: cellSize))
                node.position = CGPoint(x: (CGFloat(x) * cellSize), y: (CGFloat(y) * cellSize))
                node.fillColor = .black
                node.x = x
                node.y = y
                node.index = indexCounter
                indexCounter += 1
//                print("X:\(node.x), Y: \(node.y), Index:\(node.index), Index counter: \(indexCounter)")
                self.addChild(node)
                // TODO: Add cell coordinates
                gridArray.append(node)
                
            }
        }
    }
    
    func indexForCoordinate(x: Int, y: Int) -> Int {
        let nodeIndex = ((x) + (y * gridSize))
        return nodeIndex
    }
    
    
    
    // Clears board by setting all live nodes currentState equal to dead
    func clearBoard() {
        for i in gridArray {
            i.currentState = .dead
        }
    }
    
    // function that returns the index of a given node
    func findNodeIndex(node: Node) -> Int {
        var nodeIndex = 0
        let yMultiplier = node.y * 20
        nodeIndex = node.x + yMultiplier

        return nodeIndex
    }
    
    // Allows user to tap on the grid and toggle alive and dead nodes
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let node = atPoint(location) as? Node {
                if touchEnabled {
                    if node.currentState == .dead {
                        node.currentState = .alive
                        addLiveNodes(node: node)
                    } else {
                        node.currentState = .dead
                        removeDeadNodes()
                    }
//                    print(node.currentState)
                }
            }
//            print("location.x = \(location.x), location.y = \(location.y)")
        }
    }
    
    func checkNeighbor(node: Node) {
        
        generationBool = false
        
        // cardinal directions
        let rightNeighbor: Node = Node(x: node.x + 1, y: node.y)
        let leftNeighbor: Node = Node(x: node.x - 1, y: node.y)
        let topNeighbor: Node = Node(x: node.x, y: node.y + 1)
        let bottomNeighbor: Node = Node(x: node.x, y: node.y - 1)
        
        // diagonal directions
        let topRightNeighbor: Node = Node(x: node.x + 1, y: node.y + 1)
        let topLeftNeighbor: Node = Node(x: node.x - 1, y: node.y + 1)
        let bottomLeftNeighbor: Node = Node(x: node.x - 1, y: node.y - 1)
        let bottomRightNeighbor: Node = Node(x: node.x + 1, y: node.y - 1)
        
        // Array that holds all directions: Loop through to check neighbors currentState
        let neighborNodes: [Node] = [rightNeighbor, leftNeighbor, topNeighbor, bottomNeighbor, topRightNeighbor, topLeftNeighbor, bottomLeftNeighbor, bottomRightNeighbor]
        
        // Loops through the array of neighbors to check if the currentState is equal to alive
        let results = neighborNodes.filter { $0.currentState == .alive}
        
        // Any live cell with two or three live neighbours survives.
        if node.currentState == .alive {
            if results.count == 2 || results.count == 3 {
                node.currentState = .alive
            }
        } else {
            node.currentState = .dead
            removeDeadNodes()
        }
        
        // Any dead cell with three live neighbours becomes a live cell.
        if node.currentState == .dead {
            if results.count == 3 {
                node.currentState = .alive
            }
        } else {
            node.currentState = .dead
            removeDeadNodes()
        }
        
        // All other live cells die in the next generation. Similarly, all other dead cells stay dead.
        generationBool = true
    }
    
    // Works its way through the generations
    func playGame() {
        for node in gridArray {
            checkNeighbor(node: node)
        }
    }
    
    // Advances the generation by one instead of looping
    func advanceOneStep() {
        // How to only advance one generation?
        for nodes in liveNodes {
            checkNeighbor(node: nodes)
        }
    }
    
    // Presets methods
    
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
