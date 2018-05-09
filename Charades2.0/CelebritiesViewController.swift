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
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis", "Selena Gomez", "Amy Adams", "Alicia Keys", "Anne Hathaway", "Blake Lively", "Avril Lavigne", "Brooke Shield", "Celine Dion", "Christina Aguilera", "Corbin Bleu", "Courteney Cox", "Dakota Fanning", "Drew Barrymore", "Emma Roberts", "Ellen DeGeneres", "Emma Watson", "Fergie", "Gwen Stefani", "George Clooney", "Hugh Jackman", "Hilary Duff", "Heath Ledger", "Isla Fisher", "James Franco", "Janet Jackson", "Jennifer Lopez", "Jamie Lynn Spears", "Jessica Alba", "Joe Jonas", "John Krasinski", "Amy Pohler", "John Mayer", "Jordin Sparks", "Johnny Depp", "Jude Law", "Julia Roberts", "Josh Hutcherson", "Katie Holmes", "Kate Hudson", "Justin Timberlake", "Justin Beiber", "Keira Knightley", "Keith Urban", "Kellan Lutz", "Kelly Clarkson", "Kelly Ripa", "Kerry Washington", "Kirsten Dunst", "Kristen Stewart", "Lady Gaga", "Madonna", "Lea Michele", "Mandy Moore", "Mariah Carey", "Matt Damon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celebrityGameLabel.isHidden = true
        tapStack.isUserInteractionEnabled = false
        answerStack.isHidden = true
    }
    
    
    
    @IBAction func startGameButton(_ sender: Any) {
    
        celebrityTimerLabel.text = "\(counter)"
        
        celebrityMyTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.celebrityTimerLabel.text = "\(self.counter)"
            if self.counter == 0 {
                self.celebrityMyTimer.invalidate()
                self.giveAnswer()
            }
        }
        celebrityGameLabel.text = ("\(FamousPeople[0])")
        celebrityStartGameButton.isHidden = true
        celebrityGameLabel.isHidden = false
        celebrityTapGesture.isEnabled = true
        tapStack.isUserInteractionEnabled = true
        tapStack.addGestureRecognizer(celebrityTapGesture)
        
    }
    
    @IBAction func celebrityActionTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            celebrityCountTimesTapped += 1
            celebrityNewWord(shuffling: shuffleArray())
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: view)
            
            if(location.x < width/2){
                print("Left")
                celebrityWrong += 1
                
            }
            else {
                print("Right")
                celebrityRight += 1
            }
        }
    }
    
    func celebrityNewWord(shuffling: [String]) {
        if FamousPeople.count > celebrityCountTimesTapped {
            celebrityGameLabel.text = shuffling[celebrityCountTimesTapped]
        } else {
            giveAnswer()
        }
    }
    
    func giveAnswer() {
        answerStack.isHidden = false
        celebrityGameLabel.isHidden = true
        celebrityTimerLabel.isHidden = true
        wrongAnswer.text = ("You passed \(celebrityWrong) people")
        rightAnswer.text = ("You got \(celebrityRight) correct")
        celebrityTapGesture.isEnabled = false
        tapStack.isUserInteractionEnabled = false
    }
    func shuffleArray() -> [String] {
        var randomNumber: Int
        var FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis", "Selena Gomez", "Amy Adams", "Alicia Keys", "Anne Hathaway", "Blake Lively", "Avril Lavigne", "Brooke Shield", "Celine Dion", "Christina Aguilera", "Corbin Bleu", "Courteney Cox", "Dakota Fanning", "Drew Barrymore", "Emma Roberts", "Ellen DeGeneres", "Emma Watson", "Fergie", "Gwen Stefani", "George Clooney", "Hugh Jackman", "Hilary Duff", "Heath Ledger", "Isla Fisher", "James Franco", "Janet Jackson", "Jennifer Lopez", "Jamie Lynn Spears", "Jessica Alba", "Joe Jonas", "John Krasinski", "Amy Pohler", "John Mayer", "Jordin Sparks", "Johnny Depp", "Jude Law", "Julia Roberts", "Josh Hutcherson", "Katie Holmes", "Kate Hudson", "Justin Timberlake", "Justin Beiber", "Keira Knightley", "Keith Urban", "Kellan Lutz", "Kelly Clarkson", "Kelly Ripa", "Kerry Washington", "Kirsten Dunst", "Kristen Stewart", "Lady Gaga", "Madonna", "Lea Michele", "Mandy Moore", "Mariah Carey", "Matt Damon"]
        var upperLimit = FamousPeople.count
        
        for _ in 1...FamousPeople.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledPeople.append(FamousPeople[randomNumber])
            FamousPeople.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledPeople
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}




