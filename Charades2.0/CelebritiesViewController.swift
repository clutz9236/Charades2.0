//
//  CelebritiesViewController.swift
//  Charades2.0
//
//  Created by Claire E. Lutz on 5/2/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CelebritiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
   
    @IBOutlet weak var tapStackView: UIStackView!
    @IBOutlet weak var celebrityStartGameButton: UIButton!
    @IBOutlet weak var celebrityGameLabel: UILabel!
    @IBOutlet weak var celebrityTimerLabel: UILabel!
    @IBOutlet weak var rightAnswer: UILabel!
    @IBOutlet var celebrityTapGesture: UITapGestureRecognizer!
    
    
    var countTimesTapped = 0
    var counter = 45
    var celebrityMyTimer: Timer!
    var celebrityRight = 0
    var celebrityWrong = 0
    var celebrityCountTimesTapped = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var shuffledPeople = [String]()
    var color = [UIColor]()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis", "Selena Gomez", "Amy Adams", "Alicia Keys", "Anne Hathaway", "Blake Lively", "Avril Lavigne", "Brooke Shield", "Celine Dion", "Christina Aguilera", "Corbin Bleu", "Courteney Cox", "Dakota Fanning", "Drew Barrymore", "Emma Roberts", "Ellen DeGeneres", "Emma Watson", "Fergie", "Gwen Stefani", "George Clooney", "Hugh Jackman", "Hilary Duff", "Heath Ledger", "Isla Fisher", "James Franco", "Janet Jackson", "Jennifer Lopez", "Jamie Lynn Spears", "Jessica Alba", "Joe Jonas", "John Krasinski", "Amy Pohler", "John Mayer", "Jordin Sparks", "Johnny Depp", "Jude Law", "Julia Roberts", "Josh Hutcherson", "Katie Holmes", "Kate Hudson", "Justin Timberlake", "Justin Beiber", "Keira Knightley", "Keith Urban", "Kellan Lutz", "Kelly Clarkson", "Kelly Ripa", "Kerry Washington", "Kirsten Dunst", "Kristen Stewart", "Lady Gaga", "Madonna", "Lea Michele", "Mandy Moore", "Mariah Carey", "Matt Damon", "Ed Sheeran"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celebrityGameLabel.isHidden = true
        tapStackView.isUserInteractionEnabled = false
        rightAnswer.isHidden = true
    }
    
    
    
    @IBAction func startGameButton(_ sender: Any) {
    
        celebrityTimerLabel.text = "\(counter)"
        
        celebrityMyTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.celebrityTimerLabel.text = "\(self.counter)"
            if self.counter == 0 {
                self.celebrityMyTimer.invalidate()
                self.giveAnswer()
                print(self.shuffledPeople)
            }
        }
        celebrityNewWord(shuffling: shuffleArray())
        celebrityStartGameButton.isHidden = true
        celebrityGameLabel.isHidden = false
        celebrityTapGesture.isEnabled = true
        tapStackView.isUserInteractionEnabled = true
        tapStackView.addGestureRecognizer(celebrityTapGesture)
        
    }
    
    @IBAction func celebrityActionTap(_ sender: UITapGestureRecognizer) {
         let location = celebrityTapGesture.location(in: view)
        if sender.state == .ended {
            celebrityCountTimesTapped += 1
            celebrityNewWord(shuffling: shuffleArray())
            
            if(location.x < width/2){
                print("Left")
                celebrityRight += 1
                color.append(.green)
            }
            else {
                print("Right")
                celebrityWrong += 1
                color.append(.red)
            }
        }
    }
    
    func celebrityNewWord(shuffling: [String]) {
        if FamousPeople.count > celebrityCountTimesTapped {
            celebrityGameLabel.text = shuffling[celebrityCountTimesTapped]
        } else {
            giveAnswer()
            print(shuffledPeople)
        }
    }
    
    func giveAnswer() {
        rightAnswer.isHidden = false
        celebrityGameLabel.isHidden = true
        celebrityTimerLabel.isHidden = true
        if celebrityRight >= 0 {
            let calculations: Double = Double(celebrityRight)/Double(celebrityCountTimesTapped)
            let percentage = round(calculations * 100)
            rightAnswer.text = ("You got \(celebrityRight) correct, \(celebrityWrong) incorrect, and \(percentage)% right.")
        } else {
            rightAnswer.text = ("You got \(celebrityRight) correct, \(celebrityWrong) incorrect, and 0% right.")
        }
        celebrityTapGesture.isEnabled = false
        tapStackView.isUserInteractionEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: height - 550, width: width, height: height)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebrityRight + celebrityWrong
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shuffled = shuffleArray()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = shuffled[indexPath.row]
        cell?.textLabel?.textColor = color[indexPath.row]
        return cell!
    }
}




