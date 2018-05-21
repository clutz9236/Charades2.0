//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class HarryPotterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var tapStackView: UIStackView!
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var shuffledHarryPotter = [String]()
    var color = [UIColor]()
    var score = 0
    var buttonTag = 0
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    
   let harryPotterWords = ["Harry Potter", "Voldemort", "Dumbledore", "Draco Malfoy", "Ron Weasley", "Hermione Granger", "Salazar Slytherin", "Godric Gryffindor", "Rowena Ravenclaw", "Helga Hufflepuff", "Percy Weasley", "Severus Snape", "Minerva McGonagall", "Lavendar Brown", "Seamus Finnegan", "Neville Longbottom", "Rubeus Hagrid", "Fred Weasley", "George Weasley", "Molly Weasley", "Ginny Weasley", "Bill Weasley", "Charlie Weasley", "Arthur Weasley", "Oliver Wood", "Katie Bell", "Rita Skeeter", "Lucius Malfoy", "Bellatrix Lestrange", "Narcissa Malfoy", "Nagini", "Dean Thomas", "Lily Potter", "James Potter",  "Sirius Black", "Remus Lupin", "Regulus Black", "Dobby", "Buckbeak", "Hedwig", "Mad-eye Moody", "Philosopher's Stone", "Chamber of Secrets", "Prisoner of Azkaban", "Goblet of Fire", "Order of the Phoenix", "Half-Blood Prince", "Deathly Hallow", "Alohomora", "Lumos", "Wingardium Leviosa", "Expelliarmus", "Sectumsempra", "Obliviate", "Nox", "Cedric Diggory", "Cho Chang", "Penelope Clearwater", "Dudley Dursley", "Vernon Dursley", "Petunia Dursley", "Fleur Delacour", "Argus Filch", "Cornelius Fudge", "Three Broomsticks", "Filius Flitwick", "Fenrir Greyback", "Gellert Grindelwald", "Rolands Hooch", "Viktor Krum", "Gilderoy Lockhart", "Alice Longbottom", "Luna Lovegood", "Garrick Ollivander", "Peter Pettigrew", "The Marauders", "Poppy Pomfrey", "Helena Ravenclaw", "Kingsley Shacklebolt", "Nymphadora Tonks", "Sybill Trelawney", "Dolores Umbridge", "Moaning Myrtle", "Crookshanks"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStackView.isUserInteractionEnabled = false
        resultsLabel.isHidden = true
        
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
        if harryPotterWords.count > countTimesTapped {
            gameLabel.text = shuffling[countTimesTapped]
        } else {
            giveAnswer()
            print(shuffledHarryPotter)
        }
    }
    
    func giveAnswer() {
        if right >= 0 {
            let calculations: Double = Double(right)/Double(countTimesTapped)
            let percentage = Double(calculations * 100)
            resultsLabel.text = ("You got \(right) correct, \(wrong) incorrect, and \(percentage)% right.")
        } else {
            resultsLabel.text = ("You got \(right) correct, \(wrong) incorrect, and 0% right.")
        }
        resultsLabel.isHidden = false
        gameLabel.isHidden = true
        timerLabel.isHidden = true
        tapGestureOutlet.isEnabled = false
        tapStackView.isUserInteractionEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: height - 550, width: width, height: height)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func shuffleArray() -> [String] {
        var randomNumber: Int
        var harryPotter = ["Harry Potter", "Voldemort", "Dumbledore", "Draco Malfoy", "Ron Weasley", "Hermione Granger", "Salazar Slytherin", "Godric Gryffindor", "Rowena Ravenclaw", "Helga Hufflepuff", "Percy Weasley", "Severus Snape", "Minerva McGonagall", "Lavendar Brown", "Seamus Finnegan", "Neville Longbottom", "Rubeus Hagrid", "Fred Weasley", "George Weasley", "Molly Weasley", "Ginny Weasley", "Bill Weasley", "Charlie Weasley", "Arthur Weasley", "Oliver Wood", "Katie Bell", "Rita Skeeter", "Lucius Malfoy", "Bellatrix Lestrange", "Narcissa Malfoy", "Nagini", "Dean Thomas", "Lily Potter", "James Potter",  "Sirius Black", "Remus Lupin", "Regulus Black", "Dobby", "Buckbeak", "Hedwig", "Mad-eye Moody", "Philosopher's Stone", "Chamber of Secrets", "Prisoner of Azkaban", "Goblet of Fire", "Order of the Phoenix", "Half-Blood Prince", "Deathly Hallow", "Alohomora", "Lumos", "Wingardium Leviosa", "Expelliarmus", "Sectumsempra", "Obliviate", "Nox", "Cedric Diggory", "Cho Chang", "Penelope Clearwater", "Dudley Dursley", "Vernon Dursley", "Petunia Dursley", "Fleur Delacour", "Argus Filch", "Cornelius Fudge", "Three Broomsticks", "Filius Flitwick", "Fenrir Greyback", "Gellert Grindelwald", "Rolands Hooch", "Viktor Krum", "Gilderoy Lockhart", "Alice Longbottom", "Luna Lovegood", "Garrick Ollivander", "Peter Pettigrew", "The Marauders", "Poppy Pomfrey", "Helena Ravenclaw", "Kingsley Shacklebolt", "Nymphadora Tonks", "Sybill Trelawney", "Dolores Umbridge", "Moaning Myrtle", "Crookshanks"]
        
        
        var upperLimit = harryPotter.count
        
        for _ in 1...harryPotter.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledHarryPotter.append(harryPotter[randomNumber])
            harryPotter.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledHarryPotter
    }
    
    
    @IBAction func startGameButton(_ sender: Any) {
        timerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.timerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.giveAnswer()
                print(self.shuffledHarryPotter)
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
        tapStackView.isUserInteractionEnabled = true
        tapStackView.addGestureRecognizer(tapGestureOutlet)
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
