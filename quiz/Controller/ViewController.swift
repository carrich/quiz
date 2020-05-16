//
//  ViewController.swift
//  quiz
//
//  Created by Ngoduc on 5/15/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageQ: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var questionCouter: UILabel!
    
    
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var rButton: UIButton!
    
//    let AllQuestion = QuestionDB().list
    
    let all = QuestionDB().listQuest()
    var AllQuestion: [Question]!
    var questionNumber:Int = 0
    var score = 0
    var selectedAnswer = 0
    var time1 = Timer()
    
    var count = 1
    var audioPlayer: AVAudioPlayer!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       let FV = StartViewController()
        let qN = FV.questionN
        print(qN)
        AllQuestion = FV.AllQuestion1
        
       print(AllQuestion!)
//        time1 = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
       updateQuestion()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("correct")
            
            score += 1
            // setting up url for your soundtrack
                let soundURL = Bundle.main.url(forResource: "ok1", withExtension: "mp3")
                do {
            // setting up audio player to play your sound
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
                } catch  {
            // in case any errors occur
                    print(error)
                }

            // playing your audio file
                audioPlayer.play()
          
        } else {
            print("wrong")
        }
        count = 0
        questionNumber += 1
        updateQuestion()
    }
    func updateQuestion(){
        
        if questionNumber  < all.count{
            imageQ.image = UIImage(named: AllQuestion[questionNumber].QuestionImage)
             selectedAnswer = AllQuestion[questionNumber].correctAnswer
        } else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { action in
                self.restartQuest()
            }
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
        }
       updateUI()
    }
    func updateUI(){
//        scoreLable.text = "Score: \(score)"
//        questionCouter.text = "\(questionNumber + 1)/\(all.count)"
        
    }
    func restartQuest(){
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    @objc func update(){
        count += 1
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(5)) * CGFloat(count)
        if count == 5 {
            count = 0
            questionNumber += 1
                   updateQuestion()
                   updateUI()
        }
       
    }
}

