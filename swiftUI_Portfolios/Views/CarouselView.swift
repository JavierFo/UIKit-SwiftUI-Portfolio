//
//  CarouselView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/20/25.
//

import SwiftUI

struct CarouselView: View {
    @StateObject var game = EmojiMemoryGame()
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("SwiftUI Portfolio")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(3)
                .padding(.leading)
            
            NavigationStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Group {
                            CartitaView(image: "bunny", category: "SwiftUI", heading: "Developing a Carousel UI with Bunny", author: "Javier Ferrer")
                            
                            CartitaView(image: "duck", category: "macOS", heading: "Building a Portfolio App with Duck", author: "Javier Ferrer")
                            
                            NavigationLink(destination: EmojiMemoryGameView(viewModel: game)){
                            CartitaView(image: "smile", category: "watchOS", heading: "Drawing Stanford University's CS193p Memory game with Smile", author: "Stanford University")
                            }
                            
                            NavigationLink(destination: ContentView()){
                                CartitaView(image: "dino", category: "iOS", heading: "Drawing a Cryptocurrency List with Dino", author: "Javier Ferrer")
                            }
                        }
                        .frame(width: 300)
                    }
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
