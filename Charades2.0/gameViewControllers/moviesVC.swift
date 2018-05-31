
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class moviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var tapStack: UIStackView!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    @IBOutlet weak var correctAnswer: UILabel!
    
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var shuffledWHAT = [String]()
    var color = [UIColor]()
    var score = 0
    var buttonTag = 0
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    let movies =  ["Titanic", "The Godfather", "Star Wars", "The Wizard of Oz", "Jaws", "Rocky", "Gone with the Wind", "Psycho", "The Terminator", "King Kong", "Jurassic Park", "Casablanca", "Back to the Future" ,"Raiders of the Lost Ark", "E.T.", "The Matrix", "Ferris Bueller's Day Off", "The Silence of the Lambs", "Citizen Kane", "High School Musical", "Cadet Kelly", "The Princess Bride", "The Shining", "Pulp Ficiton", "Top Gun", "Ghostbusters", "Forrest Gump", "Mission: Impossible", "Lady and the Tramp", "The Lion King", "Beauty and the Beast", "Saturday Night Fever", "Remember the Titans", "Avengers", "Harry Potter", "Caddyshack", "Dirty Dancing", "The Lord of the Rings", "Die Hard", "Toy Story", "Superman", "Singin in the Rain", "A Christmas Story", "Rain Man", "The Sound of Music", "Edward Scissorhands", "Schindler's List", "Groundhog Day", "Mean Girls", "Blade Runner", "Poltergeist", "Scream", "I Know What You Did Last Summer", "Grease", "West Side Story", "Footloose", "It's a Wonderful Life", "The Sandlot", "Saving Private Ryan", "The Shawshank Redemption", "The Breakfast Club", "Sixteen Candles", "Planet of the Apes", "The Dark Knight", "10 Things I Hate About You", "The Exorcist", "Mary Poppins", "Rebel Without a Cause", "Apollo 13", "Willy Wonka and the Chocolate Factory", "Breakfast at Tiffany's", "Snow White and the Seven Dwarves", "Herbie Fully Loaded", "The Parent Trap", "Bambi", "Carrie", "Rudy", "Clueless", "Home Alone", "Pirates of the Caribbean", "V for Vendetta", "Finding Nemo", "Finding Dory", "Mrs. Doubtfire", "Peter Pan", "Jumanji", "Good Will Hunting", "Shrek", "Heathers", "Men in Black", "Deadpool", "The Truman Show"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStack.isUserInteractionEnabled = false
        correctAnswer.isHidden = true
        
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "animalSegue" {
            buttonTag = 1
        } else if segue.identifier == "celebritySegue" {
            buttonTag = 2
        }
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        let location = tapGestureOutlet.location(in: view)
        if sender.state == .ended {
            countTimesTapped += 1
            newWord(shuffling: shuffleArray())
            
            if(location.x < width/2){
                print("Left")
                right += 1
                color.append(.green)
                
            } else {
                print("Right")
                wrong += 1
                color.append(.red)
                
            }
            
        }
        
    }
    
    func newWord(shuffling: [String]) {
        if movies.count > countTimesTapped {
            gameLabel.text = shuffling[countTimesTapped]
        } else {
            giveAnswer()
            print(shuffledWHAT)
        }
    }
    
    func giveAnswer() {
        if right >= 0 {
            let calculations: Double = Double(right)/Double(countTimesTapped)
            let percentage = round(calculations * 100)
            correctAnswer.text = ("You got \(right) correct, \(wrong) incorrect, and \(percentage)% right.")
        } else {
            correctAnswer.text = ("You got \(right) correct, \(wrong) incorrect, and 0% right.")
        }
        correctAnswer.isHidden = false
        gameLabel.isHidden = true
        TimerLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStack.isUserInteractionEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: height - 550, width: width, height: height)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func shuffleArray() -> [String] {
        var randomNumber: Int
        var movies = ["Titanic", "The Godfather", "Star Wars", "The Wizard of Oz", "Jaws", "Rocky", "Gone with the Wind", "Psycho", "The Terminator", "King Kong", "Jurassic Park", "Casablanca", "Back to the Future" ,"Raiders of the Lost Ark", "E.T.", "The Matrix", "Ferris Bueller's Day Off", "The Silence of the Lambs", "Citizen Kane", "High School Musical", "Cadet Kelly", "The Princess Bride", "The Shining", "Pulp Ficiton", "Top Gun", "Ghostbusters", "Forrest Gump", "Mission: Impossible", "Lady and the Tramp", "The Lion King", "Beauty and the Beast", "Saturday Night Fever", "Remember the Titans", "Avengers", "Harry Potter", "Caddyshack", "Dirty Dancing", "The Lord of the Rings", "Die Hard", "Toy Story", "Superman", "Singin' in the Rain", "A Christmas Story", "Rain Man", "The Sound of Music", "Edward Scissorhands", "Schindler's List", "Groundhog Day", "Mean Girls", "Blade Runner", "Poltergeist", "Scream", "I Know What You Did Last Summer", "Grease", "West Side Story", "Footloose", "It's a Wonderful Life", "The Sandlot", "Saving Private Ryan", "The Shawshank Redemption", "The Breakfast Club", "Sixteen Candles", "Planet of the Apes", "The Dark Knight", "10 Things I Hate About You", "The Exorcist", "Mary Poppins", "Rebel Without a Cause", "Apollo 13", "Willy Wonka and the Chocolate Factory", "Breakfast at Tiffany's", "Snow White and the Seven Dwarves", "Herbie Fully Loaded", "The Parent Trap", "Bambi", "Carrie", "Rudy", "Clueless", "Home Alone", "Pirates of the Caribbean", "V for Vendetta", "Finding Nemo", "Finding Dory", "Mrs. Doubtfire", "Peter Pan", "Jumanji", "Good Will Hunting", "Shrek", "Heathers", "Men in Black", "Deadpool", "The Truman Show"]
        var upperLimit = movies.count
        
        for _ in 1...movies.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledWHAT.append(movies[randomNumber])
            movies.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledWHAT
    }
    
    
    @IBAction func startGameButton(_ sender: Any) {
        TimerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.TimerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.giveAnswer()
                print(self.shuffledWHAT)
                self.player.pause()
            }
        }
        do
            
        {
            
            let audioPath = Bundle.main.path(forResource: "music", ofType: "mp3")
            
            try self.player = AVAudioPlayer (contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            print("inside do")
        }
        catch
        {
            //ERROR
        }
        
        self.player.play()
        
        newWord(shuffling: shuffleArray())
        startGameOutlet.isHidden = true
        gameLabel.isHidden = false
        tapGestureOutlet.isEnabled = true
        tapStack.isUserInteractionEnabled = true
        tapStack.addGestureRecognizer(tapGestureOutlet)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return right + wrong
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shuffled = shuffleArray()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = shuffled[indexPath.row]
        cell?.textLabel?.textColor = color[indexPath.row]
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}
