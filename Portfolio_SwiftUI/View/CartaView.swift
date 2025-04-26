//
//  CartaView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/24/25.
//

import SwiftUI

struct CartaView: View {
    var card: MemoryGame<String>.Card
//    let content: String
//    @State var isFaceUp = false
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 5
        }
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 5
            static let scaleFactor = smallest / largest
        }
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(Constants.inset)
            .modifier(Cardify(isFaceUp: card.isFaceUp))
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//        ZStack{
//            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
//            Group {
//                base.foregroundColor(.white)
//                base.strokeBorder(style: StrokeStyle(lineWidth: Constants.FontSize.smallest, dash: [10,2]))
//                Pie(endAngle: .degrees(240))
//                    .opacity(Constants.Pie.opacity)
//                    .overlay(
//                        Text(card.content)
//                            .font(.system(size: Constants.FontSize.largest))
//                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
//                            .aspectRatio(1, contentMode: .fit)
//                            .padding(Constants.Pie.inset)
//                    )
//                    .padding(Constants.inset)
//            }
            
            //base.fill().opacity(card.isFaceUp ? 0 : 1)
        //}
//        .onTapGesture(count: 2) {
//            isFaceUp.toggle()
//        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 2).repeatForever(autoreverses: false)
    }
}

struct CartaView_Previews: PreviewProvider {
    typealias Card = MemoryGame<String>.Card
    static var previews: some View {
        HStack{
            CartaView(Card(isFaceUp: true, content: "X", id: "test1"))
            CartaView(Card(content: "X", id: "test1"))
        }
            .padding()
            .foregroundColor(.blue)
    }
}

//ANIMATIONS: animating a shape or..., animate Views via their viewModifiers.
