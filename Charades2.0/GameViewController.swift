//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    

    @IBOutlet weak var tapStack: UIStackView!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    let screenSize = UIScreen.main.bounds
    

   let AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo"]
    
    
  
        override func viewDidLoad() {
            super.viewDidLoad()
       
        
        gameLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStack.isUserInteractionEnabled = false
            
    }

    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        var location: CGPoint = sender.location(in: sender.view)
        if sender.state == .ended {
            countTimesTapped += 1
            newWord()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        for touch in touches {
            let location = touch.location(in: view)
            
            if(location.x < screenWidth/2){
                print("Left")
                wrong += 1
                
            }
            else {
                print("Right")
                right += 1
            }
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
        tapGestureOutlet.isEnabled = true
        tapStack.isUserInteractionEnabled = true
        tapStack.addGestureRecognizer(tapGestureOutlet)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
