//
//  PopupViewController.swift
//  BeatYourself
//
//  Created by 077tech on 2022/07/03.
//

import UIKit
import AVFoundation

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBAction func continueButtonClick(_ sender: Any) {
        self.dismiss(animated: false)
    }

    
    @IBOutlet weak var quitButton: UIButton!
    @IBAction func quitButtonClick(_ sender: Any) {
        if let first = presentingViewController,
                let second = first.presentingViewController{
                  first.view.isHidden = true
                  second.dismiss(animated: true)
             }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesign()
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }
    
    func UIDesign(){
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 30
        popupView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.white.cgColor
        quitButton.layer.borderWidth = 1
        quitButton.layer.borderColor = UIColor.white.cgColor
        
    }
}
