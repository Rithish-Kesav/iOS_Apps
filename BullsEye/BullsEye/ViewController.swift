//
//  ViewController.swift
//  BullsEye
//
//  Created by Rithishkesav Saravanan on 18/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var finalScore = 0
    var roundCount = 1
    
    //MARK: IBOutlets
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var viewScore: UILabel!
    @IBOutlet weak var viewRound: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        resetButton()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert(){
        
        let difference = abs(currentValue-targetValue)
        
        var points = 100 - difference
        
        let title:String
        if difference == 0{
            title = "Perfect score!"
            points += 100
        }
        else if difference == 1{
            title = "You just missed it by 1"
            points += 50
        }
        else if difference < 5{
            title = "You almost got it!"
        }
        else if difference < 10{
            title = "Still pretty good :)"
        }
        else{
            title = "Are you even trying?"
        }
        
        finalScore += points
        roundCount += 1
        
        let message = "Nice! You scored: \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func resetButton() {
        finalScore = 0
        roundCount = 1
        startNewRound()
    }
    
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        updateScores()
        updateRounds()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }
    
    func updateScores(){
        viewScore.text = String(finalScore)
    }
    
    func updateRounds(){
        viewRound.text = String(roundCount)
    }


}

