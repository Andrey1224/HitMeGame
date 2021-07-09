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
        
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

        
        startOverButtonPressed()
    }
    
    
    @IBAction func showAlert() {
        
        
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        
        let title: String
        if difference == 0 {
            points += 100
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        }  else if difference < 10 {
            title = "Pretty good!"
            if difference == 1 {
                points += 50
            }
        } else {
            title = "Not even close..."
        }
        score += points
        
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler:{ _ in
                self.startNewRound()
              })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
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
    
    
    
    @IBAction func startOverButtonPressed() {
        
        score = 0
        round = 0
        
        startNewRound()
          
          let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)
        
    }
    
    
}



