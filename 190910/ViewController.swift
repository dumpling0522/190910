//
//  ViewController.swift
//  190910
//
//  Created by 水餃 on 2019/9/10.
//  Copyright © 2019年 水餃. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var moveTimes: UILabel!
    var images = ["willson1", "willson1","willson2","willson2","willson3","willson3","willson4","willson4","willson5","willson5","willson6","willson6",]
    func updateCards() {
        images.shuffle()
        var i = 0
        for cardButton in cardButtons {
            cardButton.setBackgroundImage(UIImage(named: "back"), for: UIControl.State.normal)
            i += 1
        }
        moves = 0
        moveTimes.text = "\(moves)"
        two = 0
        winLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateCards()
      
    }

    @IBAction func replay(_ sender: Any) {
        for cardButton in cardButtons {
            cardButton.isUserInteractionEnabled = true 
        }
        updateCards()
    }
    
    var lastFlipNumber = -1
    var moves = 0
    var two = 0
    @IBAction func flipCard(_ sender: UIButton) {
        let number = cardButtons.firstIndex(of: sender)!
        
       
        
        sender.setBackgroundImage(UIImage(named: images[number]), for: UIControl.State.normal)
        UIView.transition(with: sender, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
        print(lastFlipNumber, number)
        self.moves += 1
        self.moveTimes.text = "\(self.moves)"
        if lastFlipNumber != -1 {
            print(images[number],  images[lastFlipNumber])
            
            if images[number] != images[lastFlipNumber] {
                self.view.isUserInteractionEnabled = false
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    
                
                   
                    self.view.isUserInteractionEnabled = true
                    
                    self.cardButtons[self.lastFlipNumber].setBackgroundImage(UIImage(named: "back"), for: UIControl.State.normal)
                    UIView.transition(with: self.cardButtons[self.lastFlipNumber], duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
                    
                    self.cardButtons[number].setBackgroundImage(UIImage(named: "back"), for: UIControl.State.normal)
                    UIView.transition(with: self.cardButtons[number], duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)
                    
                    self.lastFlipNumber = -1
                    

                    
                    
                }
            } else {
                
                self.cardButtons[self.lastFlipNumber].isUserInteractionEnabled = false
                self.cardButtons[number].isUserInteractionEnabled = false
                self.lastFlipNumber = -1
                self.two += 1
                if two == 6 {
                    winLabel.isHidden = false
                    var move = UserDefaults.standard.array(forKey: "move")
                    if move == nil {
                        move = [Int]()
                    }
                    move?.append(moves)
                    UserDefaults.standard.set(move, forKey: "move")
                }
            }
        } else {
            lastFlipNumber = number
            
        }
        
    }
    
}

