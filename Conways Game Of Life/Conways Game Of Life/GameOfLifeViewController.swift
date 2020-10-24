//
//  GameOfLifeViewController.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/12/20.
//

import UIKit
import SpriteKit

class GameOfLifeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var gridView: SKView!
    @IBOutlet var presetOne: UIButton!
    @IBOutlet var presetTwo: UIButton!
    @IBOutlet var presetThree: UIButton!
    @IBOutlet var presetFour: UIButton!
    @IBOutlet var playPauseButton: UIToolbar!
    @IBOutlet var advanceOneStepButton: UIToolbar!
    @IBOutlet var stopButton: UIToolbar!
    @IBOutlet var infoButton: UIBarButtonItem!
    @IBOutlet var speedSlider: UISlider!
    @IBOutlet var zoomSlider: UISlider!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var generationCounter: UILabel!
    
    // MARK: - Properties
    var grid: ConwaysGridView!
//    var pause: Bool = false
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grid = ConwaysGridView(size: gridView.bounds.size)
        
        // Set backround to space image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "conway-space-backround")!)
        
        // Draws grid into the view
//        let scene = ConwaysGridView(size: gridView.bounds.size)
        self.gridView.presentScene(grid)
        
//        // Takes generation label and sets text equal to counter function (returns int)
//        generationCounter.text = "Generation: \(String(describing: grid.addGeneration()))"
    }

    // MARK: - Actions
    
    @IBAction func playButtonTapped(_ sender: Any) {
        grid.playGame()
    }
    
    @IBAction func advanceOneStepButtonTapped(_ sender: Any) {
        grid.advanceOneStep()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        print("Clear button tapped")
        grid.clearBoard()
    }
    
    @IBAction func beaconButtonTapped(_ sender: Any) {
        grid.beacon()
    }
    
    @IBAction func blinkerButtonTapped(_ sender: Any) {
        grid.blinker()
    }
    
    @IBAction func gliderButtonTapped(_ sender: Any) {
        grid.glider()
    }
    
    @IBAction func toadButtonTapped(_ sender: Any) {
        grid.toad()
    }
}
