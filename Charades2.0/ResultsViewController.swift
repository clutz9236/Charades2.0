//
//  ResultsViewController.swift
//  Charades2.0
//
//  Created by Claire E. Lutz on 4/26/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var wrongAnswerLabel: UILabel!
    
    let vc = GameViewController()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightAnswerLabel.text = ("\(vc.right)")
        wrongAnswerLabel.text = ("\(vc.wrong)")
    }


    



}
