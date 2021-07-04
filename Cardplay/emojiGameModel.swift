//
//  emojiGameModel.swift
//  Cardplay
//
//  Created by hangyu on 2021/7/1.
//

import SwiftUI

class EmojiCardGame: ObservableObject {
    
    static let face = ["😀","😃","😂","🥰","😘","😎","🤯","😡","🥶","😰","😶‍🌫️","🤢","😈","👻","🎃","💩","😳","🤓"].shuffled()
    
    static let animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐔","🐧","🐦","🐤","🐺","🐗","🦆","🦅","🦉","🦇","🦄","🐝","🪱","🐳","🐬"].shuffled()
    
    static let traffic = ["🚗","🚕","🚙","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛴","🚲","🛵","🏍","🛺","🚡","🚂","✈️","🚀","🚁","🛶","⛵️","🛳","🚢","⛴"].shuffled()
    
    @Published private var model: CardGame<String> = createGame()
    
    var cards: Array<CardGame<String>.Card> {
        model.cards
    }
    
    static func createGame() -> CardGame<String> {
        CardGame<String>(n: Int(arc4random_uniform(UInt32(face.count)))) {
            Index in face[Index]
        }
    }
    
    func choose(_ card: CardGame<String>.Card) {
        model.choose(card)
    }
}
