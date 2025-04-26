//
//  EmojiMemoryGame.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/22/25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👽", "👻", "🤖", "👾", "💩", "🎃", "👊", "👀", "👹", "☠️", "🤡", "😺", "🧠", "🦣", "🗣", "🐊"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return EmojiMemoryGame.emojis[pairIndex]
            } else {
               return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        return .blue
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}

