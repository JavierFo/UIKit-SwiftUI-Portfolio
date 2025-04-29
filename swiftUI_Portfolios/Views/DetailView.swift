//
//  DetailView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/17/25.
//

import SwiftUI

struct CoinDetailView: View {
    let coin: Coin
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 5)
            
            Text(coin.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Symbol: \(coin.symbol.uppercased())")
            Text("Current Price: \(coin.currentPrice)$")
        }
        .padding()
        .navigationTitle(coin.name)
    }
}
