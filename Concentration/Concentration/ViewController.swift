//
//  ViewController.swift
//  Concentration
//
//  Created by Tarek Hany on 9/23/20.
//  Copyright © 2020 Tarek Hany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var flipsLabel: UILabel!
    
    var gameBrain = GameBrain()
    var selected: [UIButton] = []
    var labels: [UIButton: String] = [:]
    var score = 0
    var flips = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        startGame()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        flips += 1
        flipsLabel.text = "Flips: \(flips)"
        
        if selected.count < 2 {
            selected.append(sender)
            show(button: sender)
        } else {
            if selected[0].currentTitle == selected[1].currentTitle {
                selected[0].setTitle("", for: .normal)
                selected[1].setTitle("", for: .normal)
                score += 2
                if score >= 22 {
                    winGame()
                }
                selected = []
                selected.append(sender)
                show(button: sender)
            } else {
                for but in selected {
                    reset(button: but)
                }
                selected = []
                selected.append(sender)
                show(button: sender)
            }
        }
    }
    func startGame(){
        gameBrain.shuffle()
        selected = []
        flips = 0
        score = 0
        flipsLabel.text = "Flips: 0"
        for i in 0..<gameBrain.picsArray.count {
            labels[buttons[i]] = gameBrain.picsArray[i]
            reset(button: buttons[i])
            buttons[i].layer.cornerRadius = buttons[i].frame.size.height / 5
        }
    }
    func reset(button: UIButton){
        button.isEnabled = true
        button.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.3568627451, blue: 0.4431372549, alpha: 1)
        button.setTitle("", for: .normal)
    }
    func show(button: UIButton){
        button.backgroundColor = UIColor(named: "default")
        button.setTitle(labels[button], for: .normal)
        button.isEnabled = false
    }
    func winGame(){
        let alert = UIAlertController(title: "Congratulations!", message: "You won!\n Your Flips: \(flips)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .default) { (action) in
            self.startGame()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

