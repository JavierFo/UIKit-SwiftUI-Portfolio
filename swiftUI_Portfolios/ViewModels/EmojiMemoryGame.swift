//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by CS193p Instructor on 4/12/23.
//  Copyright Stanford University 2023
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis = ["🐳","🦧","🐕","🦃","🦑","🐬","🦏","🐘","🦍","🐆","🐫","🦒","🦭","🦅","🦓"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis.shuffle()
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .green
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
