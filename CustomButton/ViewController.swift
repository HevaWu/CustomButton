//
//  ViewController.swift
//  CustomButton
//
//  Created by He Wu on 2021/10/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var testButton: CustomButton!
    @IBOutlet var testButton2: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testButton.setTitle("Test Button 1", for: .normal)
        
        testButton2.setTitle("Test Button 2", for: .normal)
        testButton2.customSubtitleText = "Button 2 subtitle Text Button 2 subtitle Text Button 2 subtitle Text Button 2 subtitle Text "
    }
}

