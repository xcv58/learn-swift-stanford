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
    var selected: Bool = false
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
    
    func isSelected() -> Bool {
        return self.selected
    }
    
    func select() {
        self.selected = true
    }
    
    func unSelect() {
        self.selected = false
    }
    
    func isMatched() -> Bool {
        return self.matched
    }
    
    func match() {
        self.unSelect()
        self.matched = true
    }
    
    func unMatch() {
        self.matched = false
    }
    
    func match(card: Card) -> Bool {
        if (self.number == card.number) {
            return true
        }
        return false
    }
    
    func getTitle() -> String {
        return "\(self.number)\(self.suit)"
    }

}

