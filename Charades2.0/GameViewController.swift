//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var rightAnswerStack: UIStackView!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var wrongAnswerStack: UIStackView!
    @IBOutlet var rightAnswerTap: UITapGestureRecognizer!
    @IBOutlet var wrongAnswerTap: UITapGestureRecognizer!
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    
   let AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo"]
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja"]
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        gameLabel.isHidden = true
        
    }

    @IBAction func rightAnswerTapAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            countTimesTapped += 1
            right += 1
            newWord()
        }
    }
    
    
    @IBAction func wrongAnswerTapAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            countTimesTapped += 1
            wrong += 1
            newWord()
        }
    }
    
  
  
    
    func newWord() {
        if AnimalWords.count > countTimesTapped {
            gameLabel.text = AnimalWords[Int(arc4random_uniform(UInt32(AnimalWords.count)))]
        } else {
            gameLabel.text = "Done"
        }
    }
   
    @IBAction func startGameButton(_ sender: Any) {
        TimerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.TimerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.performSegue(withIdentifier: "ResultsSegue", sender: nil)
                
            }
            
        }
        gameLabel.text = ("\(AnimalWords[0])")
        startGameOutlet.isHidden = true
        gameLabel.isHidden = false
        rightAnswerStack.addGestureRecognizer(rightAnswerTap)
        wrongAnswerStack.addGestureRecognizer(wrongAnswerTap)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
