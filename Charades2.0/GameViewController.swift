//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    
    var counter = 45
    var myTimer: Timer!
    
   let AnimalWords =  ["llama", "dog", "mockingbird", "fly", "parrot", "sheep", "coyote", "lion", "zebra", "cheetah", "polar bear", "bear", "owl", "tiger", "husky", "panda", "monkey", "penguin", "peacock", "fox", "dolphin", "deer", "chicken", "turkey", "pig", "fish", "rhino", "cow", "frog", "bunny", "wolf", "porcupine", "whale", "kangaroo"]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        gameLabel.isHidden = true
        
        
    }

    
  
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: self.view)
        
        for animal in AnimalWords {
            gameLabel.text = AnimalWords.first
        }
        
    }
    
   
    @IBAction func startGameButton(_ sender: Any) {
        TimerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.TimerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                
            }
        }
        startGameOutlet.isHidden = true
        gameLabel.isHidden = false
        gameLabel.text = ("\(AnimalWords[0])")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
