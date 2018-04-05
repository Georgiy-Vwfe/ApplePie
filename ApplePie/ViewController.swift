//
//  ViewController.swift
//  ApplePie
//
//  Created by student on 29.03.2018.
//  Copyright © 2018 Postnikov George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImgView: UIImageView!
    
    @IBOutlet weak var correctWordLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }
    var listOfWords = ["Otto", "Diana", "Maria"]
    let incorrectMovesAllowed = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var currentGame: Game!
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI();
    }
    
    func updateUI() {
        let name = "Tree \(currentGame.incorrectMovesRemaining)"
        treeImgView.image = UIImage(named: name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

