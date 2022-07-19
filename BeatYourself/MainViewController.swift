//
//  MainViewController.swift
//  BeatYourself
//
//  Created by 077tech on 2022/07/01.
//

import UIKit
import AVFoundation

protocol SendDataDelegate {
    func sendData(data: String)
}

class MainViewController: UIViewController {
    var score = 0
    var amountOfFood = 0

    
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var AmountOfFood: UILabel!

    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var CharacterImage: UIImageView!
    @IBAction func Settings(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
                vc.modalPresentationStyle = .overCurrentContext
                
                self.present(vc, animated: false)
    }
    
    @IBAction func ImageOneClick(_ sender: Any) {
        scoreFunc(imageInput: image1!)
    }
    @IBAction func ImageTwoClick(_ sender: Any) {
        scoreFunc(imageInput: image2!)
    }
    @IBAction func ImageThreeClick(_ sender: Any) {
        scoreFunc(imageInput: image3!)
    }
    @IBAction func ImageFourClick(_ sender: Any) {
        scoreFunc(imageInput: image4!)
    }
    @IBAction func ImageFiveClick(_ sender: Any) {
        scoreFunc(imageInput: image5!)
    }
    @IBAction func ImageSixClick(_ sender: Any) {
        scoreFunc(imageInput: image6!)
    }
    @IBAction func ImageSevenClick(_ sender: Any) {
        scoreFunc(imageInput: image7!)
    }
    @IBAction func ImageEightClick(_ sender: Any) {
        scoreFunc(imageInput: image8!)
    }
    @IBAction func ImageNineClick(_ sender: Any) {
        scoreFunc(imageInput: image9!)
    }
    

    
    var AudioPlayer = AVAudioPlayer()
    let url = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "mp3")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try AudioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            fatalError()
        }
        AudioPlayer.play()

        makeTimeAndDay()
        changePics()
        UIDesign()
        CharacterImageMotion()
        }
    
    override func viewDidDisappear(_ animated: Bool) {
        AudioPlayer.stop()
    }
        


    
    
    var sequenceNum = [0,1,2,3,4,5,6,7,8]
    var array_image = [
    UIImage(named: "Apple"),
    UIImage(named: "Banana"),
    UIImage(named: "Broccoli"),
    UIImage(named: "Brownie"),
    UIImage(named: "Cake"),
    UIImage(named: "Chicken"),
    UIImage(named: "Chocolate"),
    UIImage(named: "Donut"),
    UIImage(named: "Meat")
    ]
    
    var characterImageWalk = [
        UIImage(named: "Walk1"),
        UIImage(named: "Walk2"),
        UIImage(named: "Walk3"),
        UIImage(named: "Walk4"),
    ]
    
    var characterImageRun = [
        UIImage(named: "Run1"),
        UIImage(named: "Run2"),
        UIImage(named: "Run3"),
        UIImage(named: "Run4")
    ]

//.....

//.....
    func makeTimeAndDay(){
        DispatchQueue.global(qos: .userInitiated).async {
            var cnt = 0
            var bool = true
            while bool{
                for i in 1..<24{
                    DispatchQueue.main.sync {
                        self.TimeLabel.text = String(i)
                    }
                    usleep(1000000)
                }
                cnt = cnt + 1
                if cnt < 31{
                    bool = true
                }else{
                    bool = false
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            for i in 1..<31{
                DispatchQueue.main.sync {
                    self.DayLabel.text = String(i)
                }
                usleep(23000000)
            }
        }
    }
//.....

    
    
//.....
    
    func changePics(){
        DispatchQueue.global(qos: .userInitiated).async {
            var shuffled_idx = self.sequenceNum.shuffled()
            var cnt = 0
            var loopOut = true
            var usleepCnt = 1000000

            while loopOut{
                var i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image1.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image2.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image3.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image4.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image5.image = self.array_image[i]
                }
                shuffled_idx =  self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image6.image = self.array_image[i]
                }
                shuffled_idx =  self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image7.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image8.image = self.array_image[i]
                }
                shuffled_idx = self.sequenceNum.shuffled()
                i = shuffled_idx[0]
                DispatchQueue.main.sync {
                    self.image9.image = self.array_image[i]
                }
                cnt = cnt + 1

                if cnt > 30{
                   
                    DispatchQueue.main.async {
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        let vc = sb.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
                        vc.modalPresentationStyle = .overCurrentContext
                        self.present(vc, animated: false)
                        vc.showScoreLabel!.text = self.ScoreLabel.text
                    }
                    loopOut = false
                }
                usleep(useconds_t(usleepCnt))
                
                if cnt % 24 == 0 && usleepCnt > 300000{
                    usleepCnt = usleepCnt - 20000
                    print(usleepCnt)
                }
            }

        }
    }
    
    func UIDesign(){
        TopView.clipsToBounds = true
        TopView.layer.cornerRadius = 30
        TopView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        TopView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        BottomView.clipsToBounds = true
        BottomView.layer.cornerRadius = 30
        BottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        BottomView.backgroundColor = UIColor(white: 1, alpha: 0.5)
       }
//.....
    func CharacterImageMotion(){
        DispatchQueue.global(qos: .userInitiated).async {
            var loopOut = true
            var cnt = 0
            while loopOut{
                if self.score <= 0{
                    for i in 0..<self.characterImageWalk.count{
                        DispatchQueue.main.sync {
                            self.CharacterImage.image = self.characterImageWalk[i]
                        }
                        usleep(500000)
                        cnt = cnt + 1
                    }
                }else
                {
                    for i in 0..<self.characterImageRun.count{
                        DispatchQueue.main.sync {
                            self.CharacterImage.image = self.characterImageRun[i]
                        }
                        usleep(100000)
                        cnt = cnt + 1
                }
                }
                if cnt == 999999{
                    loopOut = false
                }
            }
        }
    }
//.....
    func scoreFunc(imageInput : UIImageView){
        if imageInput.image == UIImage(named: "Chicken"){
            score = score + 100
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Meat"){
            score = score + 80
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Broccoli"){
            score = score + 50
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Banana"){
            score = score + 30
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Apple"){
            score = score + 10
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Chocolate"){
            score = score - 20
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Donut"){
            score = score - 40
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Cake"){
            score = score - 80
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
        if imageInput.image == UIImage(named: "Brownie"){
            score = score - 80
            amountOfFood = amountOfFood + 1
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.sync {
                    self.ScoreLabel.text = String(self.score)
                    self.AmountOfFood.text = String(self.amountOfFood)
                }
            }
        }
    }
    
    
    
    
}
