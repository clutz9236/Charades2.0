//
//  GameViewController.swift
//  Charades2.0
//
//  Created by Amy Drelicharz on 4/20/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let AnimalWords =  ["llama", "dog", "mockingbird", "fly", "parrot", "sheep", "coyote", "lion", "zebra", "cheetah", "polar bear", "bear", "owl", "tiger", "husky", "panda", "monkey", "penguin", "peacock", "fox", "dolphin", "deer", "chicken", "turkey", "pig", "fish", "rhino", "cow", "frog", "bunny", "wolf", "porcupine", "whale", "kangaroo"]
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.setTitle("start game", for: .normal)

        
    }

  
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    



}
