//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class songsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    var shuffledSongs = [String]()
    var color = [UIColor]()
    var score = 0
    var buttonTag = 0
    
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    var cellId = "cell"
    
    let songs =  ["Party in the USA", "Hollaback Girl", "Turn Up the Music", "All Star", "Beautiful Soul", "Your Love Is My Drug", "So What", "Sk8ter Boi", "Gold Digger", "Crazy in Love", "Ridin' Solo", "Single Ladies", "Dirty Little Secret", "Hot N Cold", "Stacy's Mom", "Fergalicious", "Bye, Bye, Bye", "Sugar, We're Goin Down", "1985", "Mr. Brightside", "Call Me Maybe", "Over My Head", "Wannabe", "Hall of Fame", "You Belong With Me", "Baby", "Year 3000", "Pokerface", "I'm a Believer", "Set Fire to the Rain", "Hey Soul Sister", "Everybody Talks", "Airplanes", "Baby Got Back", "I Wanna Dance with Somebody", "Hips Don't Lie", "Oops... I Did It Again", "I Want It That Way", "Super Bass", "California Girls", "Since You Been Gone", "How to Save a Life", "Want U Back", "Sweet Carolina", "Love the Way You Lie", "The Middle", "Ride with Me", "Potential Break Up Song", "Viva La Vida", "A Thousand Miles"]
    
    
    
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
        if songs.count > countTimesTapped {
            gameLabel.text = shuffling[countTimesTapped]
        } else {
            giveAnswer()
            print(shuffledSongs)
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
        var songs = ["Party in the USA", "Hollaback Girl", "Turn Up the Music", "All Star", "Beautiful Soul", "Your Love Is My Drug", "So What", "Sk8ter Boi", "Gold Digger", "Crazy in Love", "Ridin' Solo", "Single Ladies", "Dirty Little Secret", "Hot N Cold", "Stacy's Mom", "Fergalicious", "Bye, Bye, Bye", "Sugar, We're Goin Down", "1985", "Mr. Brightside", "Call Me Maybe", "Over My Head", "Wannabe", "Hall of Fame", "You Belong With Me", "Baby", "Year 3000", "Pokerface", "I'm a Believer", "Set Fire to the Rain", "Hey Soul Sister", "Everybody Talks", "Airplanes", "Baby Got Back", "I Wanna Dance with Somebody", "Hips Don't Lie", "Oops... I Did It Again", "I Want It That Way", "Super Bass", "California Girls", "Since You Been Gone", "How to Save a Life", "Want U Back", "Sweet Carolina", "Love the Way You Lie", "The Middle", "Ride with Me", "Potential Break Up Song", "Viva La Vida", "A Thousand Miles"]
        var upperLimit = songs.count
        
        for _ in 1...songs.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledSongs.append(songs[randomNumber])
            songs.remove(at: randomNumber)
            upperLimit -= 1
        }
        return shuffledSongs
    }
    
    
    @IBAction func startGameButton(_ sender: Any) {
        TimerLabel.text = "\(counter)"
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.counter -= 1
            self.TimerLabel.text = "\(self.counter)"
            
            if self.counter == 0 {
                self.myTimer.invalidate()
                self.giveAnswer()
                print(self.shuffledSongs)
                self.player.pause()
            }
        }
        do
            
        {
            
            let audioPath = Bundle.main.path(forResource: "mp3", ofType: "mp3")
            
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
        tapStack.addGestureRecognizer(tapGestureOutlet)
        tapStack.isUserInteractionEnabled = true
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
