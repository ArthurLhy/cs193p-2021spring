//
//  ContentView.swift
//  Cardplay
//
//  Created by hangyu on 2021/6/27.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var emojiGame: EmojiCardGame
    
    var add: some View {
        Button(action: {
                /*{if emojiCount < emojis.count {
                    emojiCount += 1
 */
        }, label: {
                    Image(systemName: "plus.circle").font(.largeTitle)
        })
    }
    
    var minus: some View {
        Button(action: {
  /*              {if emojiCount > 1 {
                    emojiCount -= 1
 */
                }, label: {
                    Image(systemName: "minus.circle").font(.largeTitle)
        })
    }
    
    var face: some View {
        VStack{
            Button(action: {
                /*
                emojis = ["😀","😃","😂","🥰","😘","😎","🤯","😡","🥶","😰","😶‍🌫️","🤢","😈","👻","🎃","💩","😳","🤓"].shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
 */
            }, label: {
                VStack{
                    Image(systemName: "face.smiling").font(.largeTitle)
                    Text("Faces")
                        .font(.caption)
                }
            })
            
        }
        
    }
    
    var animal: some View {
        VStack{
            Button(action: {
 /*               emojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐔","🐧","🐦","🐤","🐺","🐗","🦆","🦅","🦉","🦇","🦄","🐝","🪱","🐳","🐬"].shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
 */
            }, label: {
                VStack{
                    Image(systemName: "hare").font(.largeTitle)
                    Text("Animals")
                        .font(.caption)
                }
            })
        }
    }
    
    var vehicles: some View {
        VStack{
            Button(action: {
/*                emojis = ["🚗","🚕","🚙","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🛴","🚲","🛵","🏍","🛺","🚡","🚂","✈️","🚀","🚁","🛶","⛵️","🛳","🚢","⛴"].shuffled()
                emojiCount = Int.random(in: 4...emojis.count)
 */
            }, label: {
                VStack{
                    Image(systemName: "car.circle").font(.largeTitle)
                    Text("Vehicles")
                        .font(.caption)
                }
            })
        }
    }
    
    var body: some View {
        VStack {
            Text("Cardgame")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))])
                {
                    ForEach(emojiGame.cards)
                        {card in Cardview(card: card)
                        .aspectRatio(2/3, contentMode:.fit)
                        .onTapGesture {
                            emojiGame.choose(card)
                        }
                    }
                }.padding(.all)
            }
            Spacer()
            HStack(alignment: .center){
                minus
                Spacer()
                face
                Spacer()
                vehicles
                Spacer()
                animal
                Spacer()
                add
            }
        }

    }
}

struct Cardview: View {
    
    let card: CardGame<String>.Card
    
    var body: some View {
        let Cardround = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                Cardround.fill().foregroundColor(.white)
                Cardround.strokeBorder(lineWidth: 4)
                Text(card.content).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            }
            else if card.isMatched {
                Cardround.opacity(0)
            }
            else {
                Cardround.fill()
            }
        }
        .foregroundColor(.orange)
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiCardGame()
        ContentView(emojiGame: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView(emojiGame: game)
            .preferredColorScheme(.light)
    }
}
