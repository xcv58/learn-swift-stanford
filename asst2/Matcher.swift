//
//  Match.swift
//  asst2
//
//  Created by xcv58 on 7/24/14.
//  Copyright (c) 2014 xcv58. All rights reserved.
//

import Foundation
let bouns = 5
let punish = -1

class Matcher {
    var cards: [Card] = []
    var score = 0
    
    init (number: Int) {
        if (number <= 0) {
            return
        }
        self.shuffle(number)
//        var deck = Deck()
////        while (cards.count < number) {
////            var tmpCard = deck.drawRandomCard()
////        }
//        for i in 1...number {
//            cards.append(deck.drawRandomCard())
//        }
    }
    
    func shuffle(number: Int) {
        var deck = Deck()
        while (cards.count < number) {
            cards.append(deck.drawRandomCard())
            var tmpCard: Card = deck.drawRandomCard()
            while (!cards[cards.count-1].match(tmpCard)) {
                deck.insertCard(tmpCard)
                tmpCard = deck.drawRandomCard()
            }
            cards.insert(tmpCard, atIndex: random() % cards.count)
        }
    }
    
    func checkMatch(index: Int) -> Bool {
        var totalSelected = 0
        for var i = 0; i < cards.count; i++ {
            if i == index {
                continue;
            }
            if cards[i].isSelected() {
                if cards[index].match(cards[i]) {
                    cards[index].match()
                    cards[i].match()
                    score += bouns
                    self.unselect()
                    return true
                }
                totalSelected++
            }
        }
        score += punish
        if totalSelected > 1 {
            self.unselect()
        }
        cards[index].select()
        return false
    }
    
    func unselect() {
        for card in cards {
            card.unSelect()
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getCardByIndex(index: Int) -> Card {
        if (index <= 0 || index >= cards.count) {
            return cards[index]
        }
        return cards[index]
    }
    
}