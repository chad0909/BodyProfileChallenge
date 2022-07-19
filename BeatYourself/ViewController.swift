//
//  ViewController.swift
//  BeatYourself
//
//  Created by 077tech on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesign()
    }

    
    func UIDesign(){
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }
    
    
    
    
    
    

    
}

