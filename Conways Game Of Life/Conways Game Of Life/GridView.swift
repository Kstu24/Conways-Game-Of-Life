//
//  GridView.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/13/20.
//

import UIKit
import Foundation

@IBDesignable
class GridView: UIView {
    
    // Bezier Path -> A path that consists of straight and curved line segments that you can render in your custom views
    private var path = UIBezierPath()
    
    // returns 100 grid cells wide
    var gridWidthCells: CGFloat { return 100 }
    // returns 100 grid cells deep
    var gridHeightCells : CGFloat { return 100 }
    // grid width is view width divided by number of x-axis cells
    var gridWidth: CGFloat { return bounds.width/CGFloat(gridWidthCells) }
    // grid height is view width divided by number of y-axis cells
    var gridHeight: CGFloat { return bounds.height/CGFloat(gridHeightCells) }
    // cetner point is the middle of bounds for x and y
    var gridCenter: CGPoint { return CGPoint(x: bounds.midX, y: bounds.midY) }

    // prepares outline for grid
    fileprivate func drawGrid() {
        path = UIBezierPath()
        path.lineWidth = 1.0

        // along the top of the grid add a new vertical line that goes to the bottom of the grid height
        for index in 1...Int(gridWidthCells) - 1 {
            let start = CGPoint(x: CGFloat(index) * gridWidth, y: 0)
            let end = CGPoint(x: CGFloat(index) * gridWidth, y:bounds.height)
            path.move(to: start)
            path.addLine(to: end)
        }

        // along the side of the grid add a new horizontal line that goes to the right of the grid width
        for index in 1...Int(gridHeightCells) - 1 {
            let start = CGPoint(x: 0, y: CGFloat(index) * gridHeight)
            let end = CGPoint(x: bounds.width, y: CGFloat(index) * gridHeight)
            path.move(to: start)
            path.addLine(to: end)
        }
        path.close()
        
        // Top border
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 374, y: 0))
        path.close()
        
        // Left border
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 360))
        path.close()
        
        // Bottom border
        path.move(to: CGPoint(x: 0, y: 346))
        path.addLine(to: CGPoint(x: 380, y: 346))
        path.close()
        
        // Right border
        path.move(to: CGPoint(x: 374, y: 0))
        path.addLine(to: CGPoint(x: 374, y: 360))
        path.close()
    }

    override func draw(_ rect: CGRect) {
        // drawGrid() prepares the structure ("path or outline of grid") while .stroke() draws the drawGrid() path
        drawGrid()
        UIColor.black.setStroke()
        path.stroke()
    }
}
