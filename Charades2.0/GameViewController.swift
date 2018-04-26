//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var startGameOutlet: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    
    
   let AnimalWords =  ["llama", "dog", "mockingbird", "fly", "parrot", "sheep", "coyote", "lion", "zebra", "cheetah", "polar bear", "bear", "owl", "tiger", "husky", "panda", "monkey", "penguin", "peacock", "fox", "dolphin", "deer", "chicken", "turkey", "pig", "fish", "rhino", "cow", "frog", "bunny", "wolf", "porcupine", "whale", "kangaroo"]
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        gameLabel.isHidden = true
        
        
    }


   
    @IBAction func startGameButton(_ sender: Any) {
        startGameOutlet.isHidden = true
        gameLabel.isHidden = false
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
