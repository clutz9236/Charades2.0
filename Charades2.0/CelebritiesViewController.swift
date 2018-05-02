//
//  CelebritiesViewController.swift
//  Charades2.0
//
//  Created by Claire E. Lutz on 5/2/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class CelebritiesViewController: UIViewController {

  
    @IBOutlet weak var celebrityRightStackView: UIStackView!
    @IBOutlet weak var celebrityWrongStackView: UIStackView!
    @IBOutlet weak var celebrityStartGameButton: UIButton!
    @IBOutlet weak var celebrityGameLabel: UILabel!
    @IBOutlet weak var celebrityTimerLabel: UILabel!
    var countTimesTapped = 0
    
    
    
    var counter = 45
    var celebrityMyTimer: Timer!
    var celebrityRight = 0
    var celebrityWrong = 0
    var celebrityCountTimesTapped = 0
    
  let FamousPeople = ["Jay - Z", "Brad Pitt", "Katy Perry", "Benedict Cumberbatch", "Donald Trump", "Oprah", "Prince Harry", "Sandra Bullock", "Tom Hanks", "Chris Pratt", "Chris Evans", "Scarlett Johansson", "Tom Holland", "Josh Brolin",  "Robert Downey Jr", "Stan Lee", "Chris Hemsworth", "Vin Diesel", "Mark Ruffalo", "Ninja", "Angelina Jolie", "Kim Kardashian", "Natalie Portman", "Viola Davis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celebrityGameLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}
