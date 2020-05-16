//
//  StartViewController.swift
//  quiz
//
//  Created by Ngoduc on 5/16/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    let questionN = 0
     let AllQuestion1 = QuestionDB().list
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    

    @IBAction func gotoGame(_ sender: Any) {
        let VC = ViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    

}
