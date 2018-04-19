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
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    var listOfWords = ["Отто", "Диана", "Мария"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLoses = 0{
        didSet{
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI();
        
    }
    
    func enableButtons(view: UIView) {
        if view is UIButton {
            let button = view as! UIButton
            button.isEnabled = true
        } else {
            for subview in view.subviews {
                enableButtons(view: subview)
            }
        }
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLoses += 1
        } else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }
    }
    
    func updateUI() {
        let name = "Tree \(currentGame.incorrectMovesRemaining)"
        treeImgView.image = UIImage(named: name)
        
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        letters[0] = letters[0].capitalized
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Выигрыши: \(totalWins), Проигрыши: \(totalLoses)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

