//
//  CelebritiesViewController.swift
//  Charades2.0
//
//  Created by Claire E. Lutz on 5/2/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CelebritiesViewController: UIViewController {

  
   
    @IBOutlet weak var tapStack: UIStackView!
    @IBOutlet weak var celebrityStartGameButton: UIButton!
    @IBOutlet weak var celebrityGameLabel: UILabel!
    @IBOutlet weak var celebrityTimerLabel: UILabel!
    @IBOutlet weak var answerStack: UIStackView!
    @IBOutlet weak var rightAnswer: UILabel!
    @IBOutlet weak var wrongAnswer: UILabel!
    @IBOutlet var celebrityTapGesture: UITapGestureRecognizer!
    
    
    var countTimesTapped = 0
    var counter = 45
    var celebrityMyTimer: Timer!
    var celebrityRight = 0
    var celebrityWrong = 0
    var celebrityCountTimesTapped = 0
    var width = UIScreen.main.bounds.width
    var shuffledPeople = [String]()
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celebrityGameLabel.isHidden = true
        tapStack.isUserInteractionEnabled = false
    }
    
    
    
    @IBAction func startGameButton(_ sender: Any) {
    
        celebrityTimerLabel.text = "\(counter)"
        
        celebrityMyTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.celebrityTimerLabel.text = "\(self.counter)"
            if self.counter == 0 {
                self.celebrityMyTimer.invalidate()
                self.performSegue(withIdentifier: "ResultsSegue", sender: nil)
            }
        }
    
        celebrityGameLabel.isHidden = false
        
        celebrityGameLabel.text = ("\(FamousPeople[0])")
        
        celebrityStartGameButton.isHidden = true
    
        
        
    }
    
    @IBAction func celebrityActionTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            celebrityCountTimesTapped += 1
            celebrityNewWord()
        }
    }
    func celebrityNewWord () {
        if FamousPeople.count > celebrityCountTimesTapped {
            celebrityGameLabel.text = FamousPeople[celebrityCountTimesTapped]
        } else {
            celebrityGameLabel.text = "Done"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}




