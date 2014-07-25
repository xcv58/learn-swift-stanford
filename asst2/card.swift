//
//  card.swift
//  asst2
//
//  Created by xcv58 on 7/24/14.
//  Copyright (c) 2014 xcv58. All rights reserved.
//

import Foundation

class Card {
    var number: String
    var suit: String = ""
    var clicked: Bool = false
    var matched: Bool = false

    init(number: String, suit: String) {
        if (Deck.validNumber(number)) {
            self.number = number
        } else {
            self.number = ""
        }
        if (Deck.validSuid(suit)) {
            self.suit = suit
        } else {
            self.suit = ""
        }
    }
    
    func getTitle() -> String {
        return "\(self.number)\(self.suit)"
    }

}

