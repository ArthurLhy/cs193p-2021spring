//
//  gameModel.swift
//  Cardplay
//
//  Created by hangyu on 2021/7/1.
//

import Foundation

struct CardGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    private var indexOfFaceup: Int?

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(n: Int, creatCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<n {
            let content = creatCardContent(i)
            cards.append(Card(id: i*2, content: content))
            cards.append(Card(id: i*2+1, content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let targetIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[targetIndex].isFaceUp,
           !cards[targetIndex].isMatched
        {
            if let faceUp = indexOfFaceup
            {
                if cards[targetIndex].content == cards[faceUp].content
                {
                    cards[targetIndex].isMatched = true
                    cards[faceUp].isMatched = true
                }
                indexOfFaceup = nil
            }
            else
            {
                indexOfFaceup = targetIndex
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
            }
            cards[targetIndex].isFaceUp.toggle()
        }
    }
    
    struct Theme {
        
    }

}



