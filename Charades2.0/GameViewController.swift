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
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var wrongAnswer: UILabel!
    @IBOutlet weak var answerStack: UIStackView!
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    let width = UIScreen.main.bounds.width
    var shuffledAnimals = [String]()

   let AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo"]
    
    
  
        override func viewDidLoad() {
            super.viewDidLoad()
       
        
        gameLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStack.isUserInteractionEnabled = false
        answerStack.isHidden = true
    }

    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            countTimesTapped += 1
            newWord(shuffling: shuffleArray())
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: view)
            
            if(location.x < width/2){
                print("Left")
                wrong += 1
                
            }
            else {
                print("Right")
                right += 1
            }
        }
    }
    
  
    func newWord(shuffling: [String]) {
        if AnimalWords.count > countTimesTapped {
            gameLabel.text = AnimalWords[Int(arc4random_uniform(UInt32(AnimalWords.count)))]
        } else {
            giveAnswer()
        }
    }
    
    func giveAnswer() {
        answerStack.isHidden = false
        gameLabel.isHidden = true
        TimerLabel.isHidden = true
        wrongAnswer.text = ("You got \(wrong) animals wrong")
        correctAnswer.text = ("You passed \(right) animals")
        tapGestureOutlet.isEnabled = false
        tapStack.isUserInteractionEnabled = false
    }
    
    func shuffleArray() -> [String] {
        var randomNumber: Int
        var AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo"]
        var upperLimit = AnimalWords.count
        
        for _ in 1...AnimalWords.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledAnimals.append(AnimalWords[randomNumber])
            AnimalWords.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledAnimals
    }
   
    @IBAction func startGameButton(_ sender: Any) {
        TimerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.TimerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.giveAnswer()
               
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
