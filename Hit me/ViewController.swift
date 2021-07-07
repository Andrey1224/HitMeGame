//
//  ViewController.swift
//  Hit me
//
//  Created by Andrii Nepodymka on 7/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var round = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
    
    var targetValue = 0
    
    var currentValue = 0
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
    }
    
    
    @IBAction func showAlert() {
        
        
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        startNewRound()
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lround(Double(slider.value))
        
    }
    
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        round += 1
      
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    
}



