//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit
import AVFoundation

class parksAndRecViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    let parksAndRec =  ["Jerry Gergich", "Councilman Bill Dexhart", "Councilman Jeremy Jamm", "Marcia Langman", "Marshall Langman", "Tammy Swanson Two", "Tammy Swanson One", "Bobby Newport", "Lawrence", "Jennifer Barkley", "Dennis Feinstein", "Joe Fantringhma", "Kim Terlando", "Mark Brandanawicz", "Craig Middlebrooks", "Eagleton", "Pawnee", "Lil' Sebastian", "Crazy Ira", "Dr. Saperstein", "Fielding Milton", "Frank Bekerson", "Marlene Knope", "Lindsay Carlisle Shay", "Typhoon Montalban", "Kelly Larson", "Chris the Doctor", "George Williams", "Kyle", "Paul Iaresco", "Dr. Harris", "Councilman Douglass Howser", "Carl Lorthner", "Hugh Trumple", "Ron Dunn", "Greg Pikitis", "Wendy Haverford", "Jessica Wicks", "Champion", "Tamara Swanson", "Justin Anderson", "Dave Sanderson", "Orin", "J.J.'s Diner", "Ken Hotate", "Wamapoke", "Shauna Malwae-Tweep", "Perd Hapley", "Joan Callamezzo", "Amy Pohler", "Mouse Rat", "Chris Pratt", "Diane Lewis", "Nick Offerman", "Mona-Lisa Spaerstein", "Jean-Ralphio Saperstein", "Ann Perkins", "Snakehole Lounge", "Harvest Festival", "Donna Meagle", "Tom Haverford", "Aziz Ansari", "Chris Traeger", "April Ludgate", "Ben Wyatt", "Cones of Dunshire", "Ron Swanson", "Leslie Knope", "Andy Dwyer", "Aubrey Plaza", "Adam Scott", "Rashida Jones", "Rob Loew", "Bil Eichner", "Jim O'Heir"]
    
    
    
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
        if parksAndRec.count > countTimesTapped {
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
        var parksAndRec =  ["Jerry Gergich", "Councilman Bill Dexhart", "Councilman Jeremy Jamm", "Marcia Langman", "Marshall Langman", "Tammy Swanson Two", "Tammy Swanson One", "Bobby Newport", "Lawrence", "Jennifer Barkley", "Dennis Feinstein", "Joe Fantringhma", "Kim Terlando", "Mark Brandanawicz", "Craig Middlebrooks", "Eagleton", "Pawnee", "Lil' Sebastian", "Crazy Ira", "Dr. Saperstein", "Fielding Milton", "Frank Bekerson", "Marlene Knope", "Lindsay Carlisle Shay", "Typhoon Montalban", "Kelly Larson", "Chris the Doctor", "George Williams", "Kyle", "Paul Iaresco", "Dr. Harris", "Councilman Douglass Howser", "Carl Lorthner", "Hugh Trumple", "Ron Dunn", "Greg Pikitis", "Wendy Haverford", "Jessica Wicks", "Champion", "Tamara Swanson", "Justin Anderson", "Dave Sanderson", "Orin", "J.J.'s Diner", "Ken Hotate", "Wamapoke", "Shauna Malwae-Tweep", "Perd Hapley", "Joan Callamezzo", "Amy Pohler", "Mouse Rat", "Chris Pratt", "Diane Lewis", "Nick Offerman", "Mona-Lisa Spaerstein", "Jean-Ralphio Saperstein", "Ann Perkins", "Snakehole Lounge", "Harvest Festival", "Donna Meagle", "Tom Haverford", "Aziz Ansari", "Chris Traeger", "April Ludgate", "Ben Wyatt", "Cones of Dunshire", "Ron Swanson", "Leslie Knope", "Andy Dwyer", "Aubrey Plaza", "Adam Scott", "Rashida Jones", "Rob Loew", "Bil Eichner", "Jim O'Heir", "The Library"]
        var upperLimit = parksAndRec.count
        
        for _ in 1...parksAndRec.count {
            randomNumber = Int(arc4random_uniform(UInt32(upperLimit)))
            shuffledAnimals.append(parksAndRec[randomNumber])
            parksAndRec.remove(at: randomNumber)
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

