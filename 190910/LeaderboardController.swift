//
//  LeaderboardController.swift
//  190910
//
//  Created by 水餃 on 2019/10/17.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class LeaderboardController: UIViewController {
    @IBOutlet weak var leaderboard: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var move = UserDefaults.standard.array(forKey: "move") as? [Int]
        move?.sort(by: { (grade1, grade2) -> Bool in
            return grade1 < grade2 
        })
        var number = 1
        if move != nil {
            for move in move! {
                leaderboard.text.append("No" + number.description + " " + move.description + "\n")
                number += 1
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
