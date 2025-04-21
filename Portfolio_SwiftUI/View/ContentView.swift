//
//  ContentView.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(destination: CoinDetailView(coin: coin)) {
                        HStack(spacing: 16) {
                            // Coin image
                            AsyncImage(url: URL(string: coin.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())

                            // Coin info
                            VStack(alignment: .leading, spacing: 4) {
                                Text(coin.name)
                                    .fontWeight(.semibold)
                                
                                Text(coin.symbol.uppercased())
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            // Market cap rank
                            Text("#\(coin.marketCapRank)")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
            .navigationTitle("Coins")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
