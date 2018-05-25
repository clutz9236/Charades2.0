//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    var shuffledAnimals = [String]()
    var color = [UIColor]()
    var score = 0
    var buttonTag = 0
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    let AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo", "Cat", "Horse", "Snake", "Dragon", "Clownfish", "African Buffalo", "Alpaca", "Baboon", "Aardvark", "African Bush Elephant", "Elephant", "Alligator", "Tortoise", "Water Spaniel", "Antelope", "Hare", "Rabbit", "Hornet", "Badger", "Camel", "Barracuda", "Basset Hound", "Beaver", "Bison", "Black Widow", "Buffalo", "Bulldog", "Butterfly", "Capybara", "Caterpillar", "Centipede", "Chameleon", "Chihuahua", "Chipmunk", "Cougar", "Crocodile", "Donkey", "Eel", "Emu", "Falcon", "Flat Coat Retriever", "Flying Squirrel", "Gecko", "Giant African Land Snail", "Honey Bee", "Seal", "Guppy", "Shark", "Mouse", "Iguana", "Jaguar", "Jellyfish", "Komodo Dragon", "Octopus", "Opossum", "Mongoose", "Platypus", "Raccoon", "Swan", "Walrus", "Wooly Mammoth"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameLabel.isHidden = true
        tapStack.isUserInteractionEnabled = false
        correctAnswer.isHidden = true
        
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
        if AnimalWords.count > countTimesTapped {
            gameLabel.text = shuffling[countTimesTapped]
        } else {
            giveAnswer()
            print(shuffledAnimals)
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
        tapStack.isUserInteractionEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: height - 550, width: width, height: height)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func shuffleArray() -> [String] {
        var randomNumber: Int
        var AnimalWords =  ["Llama", "Dog", "Fly", "Parrot", "Sheep", "Coyote", "Lion", "Zebra", "Cheetah", "Polar Bear", "Bear", "Owl", "Tiger", "Husky", "Panda", "Monkey", "Penguin", "Peacock", "Fox", "Dolphin", "Deer", "Chicken", "Turkey", "Pig", "Fish", "Rhino", "Cow", "Frog", "Bunny", "Wolf", "Porcupine", "Whale", "Kangaroo", "Cat", "Horse", "Snake", "Dragon", "Clownfish", "African Buffalo", "Alpaca", "Baboon", "Aardvark", "African Bush Elephant", "Elephant", "Alligator", "Tortoise", "Water Spaniel", "Antelope", "Hare", "Rabbit", "Hornet", "Badger", "Camel", "Barracuda", "Basset Hound", "Beaver", "Bison", "Black Widow", "Buffalo", "Bulldog", "Butterfly", "Capybara", "Caterpillar", "Centipede", "Chameleon", "Chihuahua", "Chipmunk", "Cougar", "Crocodile", "Donkey", "Eel", "Emu", "Falcon", "Flat Coat Retriever", "Flying Squirrel", "Gecko", "Giant African Land Snail", "Honey Bee", "Seal", "Guppy", "Shark", "Mouse", "Iguana", "Jaguar", "Jellyfish", "Komodo Dragon", "Octopus", "Opossum", "Mongoose", "Platypus", "Raccoon", "Swan", "Walrus", "Wooly Mammoth"]
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
                print(self.shuffledAnimals)
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
