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
    
    @IBOutlet var celebrityTapGesture: UITapGestureRecognizer!
    var countTimesTapped = 0
    
    
    
    var counter = 45
    var celebrityMyTimer: Timer!
    var celebrityRight = 0
    var celebrityWrong = 0
    var celebrityCountTimesTapped = 0
    
  
    
    
    
    

    
    
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis", "Selena Gomez", "Amy Adams", "Alicia Keys", "Anne Hathaway", "Blake Lively", "Avril Lavigne", "Brooke Shield", "Celine Dion", "Christina Aguilera", "Corbin Bleu", "Courteney Cox", "Dakota Fanning", "Drew Barrymore", "Emma Roberts", "Ellen DeGeneres", "Emma Watson", "Fergie", "Gwen Stefani", "George Clooney", "Hugh Jackman", "Hilary Duff", "Heath Ledger", "Isla Fisher", "James Franco", "Janet Jackson", "Jennifer Lopez", "Jamie Lynn Spears", "Jessica Alba", "Joe Jonas", "John Krasinski", "Amy Pohler", "John Mayer", "Jordin Sparks", "Johnny Depp", "Jude Law", "Julia Roberts", "Josh Hutcherson", "Katie Holmes", "Kate Hudson", "Justin Timberlake", "Justin Beiber", "Keira Knightley", "Keith Urban", "Kellan Lutz", "Kelly Clarkson", "Kelly Ripa", "Kerry Washington", "Kirsten Dunst", "Kristen Stewart", "Lady Gaga", "Madonna", "Lea Michele", "Mandy Moore", "Mariah Carey", "Matt Damon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celebrityGameLabel.isHidden = true
        
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




