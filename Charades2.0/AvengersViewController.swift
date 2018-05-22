//
//  AvengersViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 5/22/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class AvengersViewController: UIViewController {

    
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
    
    
    let avengersWords = ["Captain America", "Falcon", "Ant-man", "Wasp", "Vision", "Scarlet Witch", "Hulk", "Thor", "Phil Coulson", "Bucky Barnes", "Spiderman", "Hawkeye", "Black Panther", "Wakanda", "Thanos", "Proxima Midnight", "The Ebony Maw", "Corvus Glaive", "Black Dwarf", "Loki", "Rocket", "Groot", "Star Lord", "Gamora","Drax", "Mantis", "Black Widow", "Ronan The Accuser", "Ego", "Deadpool", "Nebula", "Quicksilver", "Captain Marvel", "Daredevil", "War Machine", "Apocalypse"]

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
