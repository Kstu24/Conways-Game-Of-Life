//
//  GameOfLifeViewController.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/12/20.
//

import UIKit
import SpriteKit

protocol ShouldTurnRedDelegate: class {
    func shouldTurnRed()
}

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
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var generationCounter: UILabel!
    @IBOutlet var colorSwitch: UISwitch!
    
    // MARK: - Properties
    var grid: ConwaysGridView!
    weak var delegate: ShouldTurnRedDelegate?
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grid = ConwaysGridView(size: gridView.bounds.size)
        
        // Set backround to space image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "conway-space-backround")!)
                
        // Draws grid into the view
        self.gridView.presentScene(grid)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateViews),
                                               name: .updateGenLabel,
                                               object: nil)
    }
    
    @objc private func updateViews() {
        generationCounter.text = "Generation \(grid.generationCounter)"
    }
    // MARK: - Actions
    
    @IBAction func playButtonTapped(_ sender: Any) {
        grid.playGame()
    }
    
    @IBAction func advanceOneStepButtonTapped(_ sender: Any) {
        grid.advanceOneStep()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
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
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        grid.stopLoop()
    }
    
    @IBAction func colorSwitchToggled(_ sender: Any) {
        if colorSwitch.isOn {
            grid.changeColor()
        } else {
            grid.changeColor()
        }
    }
}

extension NSNotification.Name {
    static let updateGenLabel = NSNotification.Name("updateGenLabel")
}

