//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var startGameButtonOutlet: UIButton!
    
    @IBOutlet weak var wordLabelOutlet: UILabel!
    
    @IBOutlet weak var stackedView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackedView.isHidden = true
        wordLabelOutlet.isHidden = true
         let AnimalWords =  ["llama", "dog", "mockingbird", "fly", "parrot", "sheep", "coyote", "lion", "zebra", "cheetah", "polar bear", "bear", "owl", "tiger", "husky", "panda", "monkey", "penguin", "peacock", "fox", "dolphin", "deer", "chicken", "turkey", "pig", "fish", "rhino", "cow", "frog", "bunny", "wolf", "porcupine", "whale", "kangaroo"] 
        
    }

  
    @IBAction func startGameButton(_ sender: UIButton) {
        startGameButtonOutlet.isHidden = true
        wordLabelOutlet.isHidden = false
        stackedView.isHidden = false
    }
    
    
    @IBAction func unwindToFirstViewController(unwindSegue: UIStoryboardSegue) {
        
    }
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
