//
//  ViewController.swift
//  eggTimer
//
//  Created by Siddhant Jayant Angore on 12/10/19.
//  Copyright © 2019 Siddhant Jayant Angore. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    var player : AVAudioPlayer?
    
    let preparingTime = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        
                
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = preparingTime[hardness]!
        progressBar.progress = 0
        secondsPassed = 0
        statusLabel.text = hardness
        

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    

    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressPercentage = Float(secondsPassed) / Float(totalTime)
            print(progressPercentage)
            progressBar.progress = Float(progressPercentage)
            
        }
        else {
            timer.invalidate()  //to stop the timer
            statusLabel.text = "Done!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
            player = try! AVAudioPlayer(contentsOf: url)
            player?.play()
            
        }
    }
    
    
    
}

