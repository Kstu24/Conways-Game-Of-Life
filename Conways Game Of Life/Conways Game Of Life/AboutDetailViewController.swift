//
//  AboutDetailViewController.swift
//  Conways Game Of Life
//
//  Created by Kevin Stewart on 10/12/20.
//

import UIKit

class AboutDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var ruleOne: UILabel!
    @IBOutlet var ruleTwo: UILabel!
    @IBOutlet var ruleThree: UILabel!
    @IBOutlet var ruleFour: UILabel!
    @IBOutlet var algorithmInfoTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "conway-space-backround")!)
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
