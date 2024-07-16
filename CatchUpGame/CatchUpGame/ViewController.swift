//
//  ViewController.swift
//  CatchUpGame
//
//  Created by Alperen KARACA on 16.07.2024.
//

import UIKit

class ViewController: UIViewController {
//    variables
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var flashArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
//        Views
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var flash1: UIImageView!
    @IBOutlet weak var flash2: UIImageView!
    @IBOutlet weak var flash3: UIImageView!
    @IBOutlet weak var flash4: UIImageView!
    @IBOutlet weak var flash5: UIImageView!
    @IBOutlet weak var flash6: UIImageView!
    @IBOutlet weak var flash7: UIImageView!
    @IBOutlet weak var flash8: UIImageView!
    @IBOutlet weak var flash9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
//        Highscore Control
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
//        UserInteractions
        flash1.isUserInteractionEnabled = true
        flash2.isUserInteractionEnabled = true
        flash3.isUserInteractionEnabled = true
        flash4.isUserInteractionEnabled = true
        flash5.isUserInteractionEnabled = true
        flash6.isUserInteractionEnabled = true
        flash7.isUserInteractionEnabled = true
        flash8.isUserInteractionEnabled = true
        flash9.isUserInteractionEnabled = true
        
//        GestureRecognizers
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        flash1.addGestureRecognizer(recognizer1)
        flash2.addGestureRecognizer(recognizer2)
        flash3.addGestureRecognizer(recognizer3)
        flash4.addGestureRecognizer(recognizer4)
        flash5.addGestureRecognizer(recognizer5)
        flash6.addGestureRecognizer(recognizer6)
        flash7.addGestureRecognizer(recognizer7)
        flash8.addGestureRecognizer(recognizer8)
        flash9.addGestureRecognizer(recognizer9)
        
        flashArray = [flash1 , flash2 , flash3 , flash4 , flash5 , flash6 , flash7 , flash8 , flash9]
//        Timer
        counter = 10
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
//        FlashMoves
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideFlash), userInfo: nil, repeats: true)
        
        hideFlash()
    }
//    Functions
    @objc func hideFlash() {
        
        for flash in flashArray {
            flash.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(flashArray.count - 1)))
        flashArray[random].isHidden = false
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = "\(counter)"
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            for flash in flashArray {
                flash.isHidden = true
            }
            
//            highscore
            
            if self.score >  self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
//            TimeAlerts
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideFlash), userInfo: nil, repeats: true)
                
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
         
        
    }
 

}

