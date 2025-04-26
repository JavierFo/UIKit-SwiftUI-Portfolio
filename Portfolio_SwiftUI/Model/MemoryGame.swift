//
//  MemorizeGame.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/22/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = [Card]()
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            //var faceUpCardIndices = [Int]()
            // // let faceUpCardIndices = cards.indices.filter { index in cards[index].isFaceUp }
            return cards.indices.filter { index in cards[index].isFaceUp }.only
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
            // // return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
        }
        set {
            return cards.indices.forEach { index in cards[index].isFaceUp = (newValue == index) }
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { cardToCheck in
            cardToCheck.id == card.id
        }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        if cards[chosenIndex].hasBeenSeen {
                            score -= 1
                        }
                        if cards[potentialMatchIndex].hasBeenSeen {
                            score -= 1
                        }
                    }
                    //indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
//                    for index in cards.indices {
//                        cards[index].isFaceUp = false
//                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up": "down")\(isMatched ? "matched": "")"
        }
        
        var isFaceUp: Bool = true {
            didSet {
                if oldValue && !isFaceUp {
                    hasBeenSeen = true
                }
            }
        }
        var hasBeenSeen = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
