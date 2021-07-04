//
//  CardplayApp.swift
//  Cardplay
//
//  Created by hangyu on 2021/6/27.
//

import SwiftUI

@main
struct CardplayApp: App {
    
    let game = EmojiCardGame()
    var body: some Scene {
        WindowGroup {
            ContentView(emojiGame: game)
        }
    }
}
