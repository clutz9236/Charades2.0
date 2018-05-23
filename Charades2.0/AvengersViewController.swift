//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class avengersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var tapStack: UIStackView!
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet var tapGestureOutlet: UITapGestureRecognizer!
    @IBOutlet weak var correctAnswer: UILabel!
    
    
    var counter = 45
    var myTimer: Timer!
    var right = 0
    var wrong = 0
    var countTimesTapped = 0
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var shuffledAvengers = [String]()
    var color = [UIColor]()
    var score = 0
    var buttonTag = 0
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    let avengerWords = ["Captain America", "Falcon", "Ant-man", "Wasp", "Vision", "Scarlet Witch", "Hulk", "Thor", "Phil Coulson", "Bucky Barnes", "Spiderman", "Hawkeye", "Black Panther", "Wakanda", "Thanos", "Proxima Midnight", "The Ebony Maw", "Corvus Glaive", "Black Dwarf", "Loki", "Rocket", "Groot", "Star Lord", "Gamora","Drax", "Mantis", "Black Widow", "Ronan The Accuser", "Ego", "Deadpool", "Nebula", "Quicksilver", "Captain Marvel", "Daredevil", "War Machine", "Apocalypse"]
    
    
    
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
        if avengerWords.count > countTimesTapped {
            gameLabel.text = shuffling[countTimesTapped]
        } else {
            giveAnswer()
            print(shuffledAvengers)
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
        timerLabel.isHidden = true
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
        var avengerWords = ["Captain America", "Falcon", "Ant-man", "Wasp", "Vision", "Scarlet Witch", "Hulk", "Thor", "Phil Coulson", "Bucky Barnes", "Spiderman", "Hawkeye", "Black Panther", "Wakanda", "Thanos", "Proxima Midnight", "The Ebony Maw", "Corvus Glaive", "Black Dwarf", "Loki", "Rocket", "Groot", "Star Lord", "Gamora","Drax", "Mantis", "Black Widow", "Ronan The Accuser", "Ego", "Deadpool", "Nebula", "Quicksilver", "Captain Marvel", "Daredevil", "War Machine", "Apocalypse"]
        var upperLimit = avengerWords.count
        
        for _ in 1...avengerWords.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledAvengers.append(avengerWords[randomNumber])
            avengerWords.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledAvengers
    }
    
    
    @IBAction func startGameButton(_ sender: Any) {
        timerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.timerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.giveAnswer()
                print(self.shuffledAvengers)
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
