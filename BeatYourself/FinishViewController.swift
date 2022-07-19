//
//  FinishViewController.swift
//  BeatYourself
//
//  Created by 077tech on 2022/07/04.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBAction func quitButtonClick(_ sender: Any) {
        if let first = presentingViewController,
                let second = first.presentingViewController{
                  first.view.isHidden = true
                  second.dismiss(animated: true)
             }

    }
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var showScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDesign()
        
    }
    

    func UIDesign(){
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 30
        popupView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
     
        quitButton.layer.borderWidth = 1
        quitButton.layer.borderColor = UIColor.white.cgColor
        
    }

}
