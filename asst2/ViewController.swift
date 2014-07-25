//
//  ViewController.swift
//  asst2
//
//  Created by xcv58 on 7/24/14.
//  Copyright (c) 2014 xcv58. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var flipCount: Int = 0
    var deck: Deck = Deck()
    var matcher: Matcher = Matcher(number: 20)
    
    @IBAction func flipCard(sender: UIButton) {
        let index = getButtonIndex(sender)
        
        if (sender == startButton) {
            matcher = Matcher(number: cardButtons.count)
            flipCount = 0
            updateView()
            return
        }
        
        let card: Card = matcher.getCardByIndex(index)

        if (sender.currentTitle == nil || sender.currentTitle == "") {
            sender.setTitle(card.getTitle(), forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "cardFront"), forState: .Normal)
            card.select()
        } else {
            sender.setTitle("", forState: .Normal)
            sender.setBackgroundImage(UIImage(named: "cardBack"), forState: .Normal)
            card.unSelect()
        }
        matcher.checkMatch(index)
        flipCount++
        updateView()
    }
    
    func updateView() {
        for i in 0..<cardButtons.count {
            var button = cardButtons[i]
            let card = matcher.getCardByIndex(i)
            if card.isMatched() {
                button.enabled = false
                continue
            } else {
                button.enabled = true
            }
            if card.isSelected() {
                button.setTitle(card.getTitle(), forState: .Normal)
                button.setBackgroundImage(UIImage(named: "cardFront"), forState: .Normal)
            } else {
                button.setTitle("", forState: .Normal)
                button.setBackgroundImage(UIImage(named: "cardBack"), forState: .Normal)
            }
        }
        scoreLabel.text = "Score: \(matcher.getScore())"
        flipLabel.text = "Flip: \(flipCount)"
    }
    
    @IBOutlet weak var flipLabel: UILabel!
    
    func getButtonIndex(button: UIButton) -> Int{
        var index: Int = -1
        for var i = 0; i < cardButtons.count; i++ {
            if cardButtons[i] == button {
                index = i
                break;
            }
        }
        return index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

