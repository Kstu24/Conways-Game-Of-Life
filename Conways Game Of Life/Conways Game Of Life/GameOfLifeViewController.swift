//
//  GameOfLifeViewController.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/12/20.
//

import UIKit

class GameOfLifeViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet var gridView: UIView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
