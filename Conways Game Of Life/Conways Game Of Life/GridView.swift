//
//  GridView.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/13/20.
//

import UIKit
import Foundation
import SpriteKit

//class GridView: SKScene {
//    var rows:Int!
//    var cols:Int!
//    var blockSize:CGFloat!
//
//    convenience init?(blockSize:CGFloat,rows:Int,cols:Int) {
//        guard let texture = GridView.gridTexture(blockSize: blockSize,rows: rows, cols:cols) else {
//            return nil
//        }
//        self.init(texture: texture, color:SKColor.clear, size: texture.size())
//        self.blockSize = blockSize
//        self.rows = rows
//        self.cols = cols
//    }
//
//    class func gridTexture(blockSize:CGFloat,rows:Int,cols:Int) -> SKTexture? {
//        // Add 1 to the height and width to ensure the borders are within the sprite
//        let size = CGSize(width: CGFloat(cols)*blockSize+1.0, height: CGFloat(rows)*blockSize+1.0)
//        UIGraphicsBeginImageContext(size)
//
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return nil
//        }
//        let bezierPath = UIBezierPath()
//        let offset:CGFloat = 0.5
//        // Draw vertical lines
//        for i in 0...cols {
//            let x = CGFloat(i)*blockSize + offset
//            bezierPath.move(to: CGPoint(x: x, y: 0))
//            bezierPath.addLine(to: CGPoint(x: x, y: size.height))
//        }
//        // Draw horizontal lines
//        for i in 0...rows {
//            let y = CGFloat(i)*blockSize + offset
//            bezierPath.move(to: CGPoint(x: 0, y: y))
//            bezierPath.addLine(to: CGPoint(x: size.width, y: y))
//        }
//        SKColor.black.setStroke()
//        bezierPath.lineWidth = 1.0
//        bezierPath.stroke()
//        context.addPath(bezierPath.cgPath)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return SKTexture(image: image!)
//    }
//
//    func gridPosition(row:Int, col:Int) -> CGPoint {
//        let offset = blockSize / 2.0 + 0.5
//        let x = CGFloat(col) * blockSize - (blockSize * CGFloat(cols)) / 2.0 + offset
//        let y = CGFloat(rows - row - 1) * blockSize - (blockSize * CGFloat(rows)) / 2.0 + offset
//        return CGPoint(x:x, y:y)
//    }
//}

//@IBDesignable
//class GridView: UIView {
//
//    // Bezier Path -> A path that consists of straight and curved line segments that you can render in your custom views
//    private var path = UIBezierPath()
//
//    // returns 100 grid cells wide
//    var gridWidthCells: CGFloat { return 100 }
//    // returns 100 grid cells deep
//    var gridHeightCells : CGFloat { return 100 }
//    // grid width is view width divided by number of x-axis cells
//    var gridWidth: CGFloat { return bounds.width/CGFloat(gridWidthCells) }
//    // grid height is view width divided by number of y-axis cells
//    var gridHeight: CGFloat { return bounds.height/CGFloat(gridHeightCells) }
//    // cetner point is the middle of bounds for x and y
//    var gridCenter: CGPoint { return CGPoint(x: bounds.midX, y: bounds.midY) }
//
//    // prepares outline for grid
//    fileprivate func drawGrid() {
//        path = UIBezierPath()
//        path.lineWidth = 1.0
//
//        // draws a line at the end of the width of the grid cells, along the top of the grid add a new vertical line that goes to the bottom of the grid height
//        for index in 1...Int(gridWidthCells) - 1 {
//            let start = CGPoint(x: CGFloat(index) * gridWidth, y: 0)
//            let end = CGPoint(x: CGFloat(index) * gridWidth, y:bounds.height)
//            path.move(to: start)
//            path.addLine(to: end)
//        }
//
//        // draws a line at the end of the height of the grid cells, along the side of the grid add a new horizontal line that goes to the right of the grid width
//        for index in 1...Int(gridHeightCells) - 1 {
//            let start = CGPoint(x: 0, y: CGFloat(index) * gridHeight)
//            let end = CGPoint(x: bounds.width, y: CGFloat(index) * gridHeight)
//            path.move(to: start)
//            path.addLine(to: end)
//        }
//        path.close()
//
//        // Top border
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 374, y: 0))
//        path.close()
//
//        // Left border
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 360))
//        path.close()
//
//        // Bottom border
//        path.move(to: CGPoint(x: 0, y: 346))
//        path.addLine(to: CGPoint(x: 380, y: 346))
//        path.close()
//
//        // Right border
//        path.move(to: CGPoint(x: 374, y: 0))
//        path.addLine(to: CGPoint(x: 374, y: 360))
//        path.close()
//    }
//
//    override func draw(_ rect: CGRect) {
//        // drawGrid() prepares the structure ("path or outline of grid") while .stroke() draws the drawGrid() path
//        drawGrid()
//        UIColor.black.setStroke()
//        path.stroke()
//    }
//}
