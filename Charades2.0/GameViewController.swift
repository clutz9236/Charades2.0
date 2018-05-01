//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var tapStackView: UIStackView!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    var countTimesTapped = 0
    
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    
    var counter = 45
    var myTimer: Timer!
    
   let AnimalWords =  ["llama", "dog", "fly", "parrot", "sheep", "coyote", "lion", "zebra", "cheetah", "polar bear", "bear", "owl", "tiger", "husky", "panda", "monkey", "penguin", "peacock", "fox", "dolphin", "deer", "chicken", "turkey", "pig", "fish", "rhino", "cow", "frog", "bunny", "wolf", "porcupine", "whale", "kangaroo"]
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo"]
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        gameLabel.isHidden = true
        
    }


  
  
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                countTimesTapped += 1
            newWord()
            }
    }
    
    func newWord() {
        if AnimalWords.count > countTimesTapped {
            gameLabel.text = ("\(AnimalWords[countTimesTapped])")
        } else {
            gameLabel.text = "done"
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
        tapStackView.addGestureRecognizer(tapGestureOutlet)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
