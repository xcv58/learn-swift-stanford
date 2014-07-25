//
//  Deck.swift
//  asst2
//
//  Created by xcv58 on 7/24/14.
//  Copyright (c) 2014 xcv58. All rights reserved.
//

import Foundation

let cardsNumber: [String] = ["2", "3", "4", "5", "6", "7",
    "8", "9", "10", "J", "Q", "K", "A"]
let suits: [String] = ["♥", "♦", "♣", "♠"]

class Deck {
    var cards: [Card] = [];
    
    init() {
        for i in cardsNumber {
            for j in suits {
                var tmpCard = Card(number: i, suit: j)
                self.insertCard(tmpCard)
            }
        }
    }
    
    class func validNumber(number: String) -> Bool {
        for tmpStr in cardsNumber {
            if (tmpStr == number) {
                return true
            }
        }
        return false
    }
    
    class func validSuid(suit: String) -> Bool {
        for tmpStr in suits {
            if (tmpStr == suit) {
                return true
            }
        }
        return false
    }
    
    func insertCard(card: Card) {
        cards += card
    }
    
    func insertCardFromTop(card: Card) {
        cards.insert(card, atIndex: 0)
    }
    
    func drawRandomCard() -> Card {
        if (cards.count > 0) {
            let randomSeed = random() % cards.count
            var tmpCard: Card = cards[randomSeed]
            cards.removeAtIndex(randomSeed)
            return tmpCard
        } else {
            return Card(number: "0", suit: "N")
        }
    }
    
    func printCards() {
        for card in cards {
            println("Card: \(card.number)\(card.suit)")
        }
    }
}