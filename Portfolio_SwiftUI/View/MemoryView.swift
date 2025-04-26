//
//  MemorizeView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/22/25.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    //@State var cardCount: Int = 4
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cartas
            Button("Shuffle"){
                withAnimation {
                    viewModel.shuffle()
                }
            }
            //cardCountAdjusters
        }
    }
    
    //@ViewBuilder: enhance a var to have spetial functionality. If applied to a function, it'll return something that conforms to a View but by interpreting the contents as a list of Views and combines them into one.
    //AspectVGrid: like lazyVGrid but it resizes its content views to fit the space offered to it.
    private var cartas: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CartaView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(spacing)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 3)) {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundColor(viewModel.color)
        //.imageScale(.small)
        .padding()

//        GeometryReader { geometry in
//            let gridItemSize = gridItemWidthThatFits(count: viewModel.cards.count, size: geometry.size, atAspectRatio: aspectRatio)
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
//                ForEach(viewModel.cards){ card in
//                    VStack{
//                        CartaView(card)
//                            .aspectRatio(aspectRatio, contentMode: .fit)
//                            .padding(4)
//                            .onTapGesture {
//                                viewModel.choose(card)
//                            }
//                    }
//                }
//            }
//        }
//        .foregroundColor(.green)
//        //.imageScale(.small)
//        .padding()
    }
    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button {
//            cardCount += offset
//        } label: {
//            Image(systemName: symbol)
//        }
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//        .padding()
//    }
//
//    var cardRemover: some View {
//        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//
//    var cardAdder: some View {
//        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
}

struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView(viewModel: EmojiMemoryGame())
    }
}

//@main
//struct MemorizeApp: App {
//    @StateObject var game = EmojiMemoryGame()
//    var body: some Scene {
//        WindowGroup {
//            MemorizeView(viewModel: game)
//        }
//    }
//}


