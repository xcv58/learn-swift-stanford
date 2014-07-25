//
//  ViewController.swift
//  asst2
//
//  Created by xcv58 on 7/24/14.
//  Copyright (c) 2014 xcv58. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var card: UIButton!
    
    var flipCount: Int = 0
    var deck: Deck = Deck()
    
    @IBAction func flipCard(sender: UIButton) {
        if (card.currentTitle == nil || card.currentTitle == "") {
            var tmpCard: Card = deck.drawRandomCard()
            card.setTitle(tmpCard.getTitle(), forState: .Normal)
            card.setBackgroundImage(UIImage(named: "cardFront"), forState: .Normal)
        } else {
            card.setTitle("", forState: .Normal)
            card.setBackgroundImage(UIImage(named: "cardBack"), forState: .Normal)
        }
        updateFlip()
    }
    
    @IBOutlet weak var flipLabel: UILabel!
    func updateFlip() {
        flipCount++
        flipLabel.text = "Flip: \(flipCount)"
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

