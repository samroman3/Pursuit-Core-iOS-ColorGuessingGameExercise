//
//  ViewController.swift
//  colorGuess
//
//  Created by Sam Roman on 7/30/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let arrColors = [UIColor.blue,UIColor.red,UIColor.green]
var score = Counter.init(score: 0, highScore: 0)
var red: CGFloat = 0.0
var green: CGFloat = 0.0
var blue: CGFloat = 0.0
var alpha: CGFloat = 0.0
var answer = " "
var input = " "
var count = Counter.init()

    @IBOutlet weak var colorScreen: UIView!
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainLabel: UIButton!
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        newColor()
        gameOverLabel.isHidden = true
        playAgainLabel.isHidden = true
    }
    
    
    @IBAction func redButton(_ sender: UIButton) {
        input = "red"
        findValue()
        checkInput()
    
    }

    @IBAction func greenButton(_ sender: UIButton) {
        input = "green"
        findValue()
        checkInput()
    }
    
    
    
    @IBAction func blueButton(_ sender: UIButton) {
        input = "blue"
        findValue()
        checkInput()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorScreen.backgroundColor = mixColor()
        gameOverLabel.isHidden = true
        }
    private func newColor(){
        self.colorScreen.backgroundColor = mixColor()
        
    }
    func mixColor()-> UIColor{
        red = CGFloat.random(in: 0...1)
        green = CGFloat.random(in: 0...1)
        blue = CGFloat.random(in: 0...1)
        alpha = 1.0
        let myColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return myColor
    }
    func findValue (){
        if red >= green && red >= blue {
           answer = "red"
        } else if green >= red && green >= blue {
           answer = "green"
        } else {
           answer = "blue"
        }
    }
    
    func checkInput() {
        if input == answer {
        count.increment()
        currentScoreLabel.text = "Score : \(count.score)"
        count.highScoreSetter()
            highScoreLabel.text = "High Score : \(count.highScore)"
        newColor()
        
        } else {
        count.highScoreSetter()
        highScoreLabel.text = "High Score : \(count.highScore)"
//        score = 0
        count.reset()
        currentScoreLabel.text = "Score: \(count.score)"
        gameOverLabel.isHidden = false
        playAgainLabel.isHidden = false
        }
    }
    }
    
        // Do any additional setup after loading the view.

//add counter model for high score and score - done

//add similar functions to one model file
//red, green, blue and alpha variables as well as mixColor function can be added to model file.
//findValue and checkInput can be added to struct called GameLogic as well as variables answer and input.


