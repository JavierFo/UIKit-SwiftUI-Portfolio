//
//  CoinsViewModel.swift
//  Portfolio_SwiftUI
//
//  Created by Javier FO on 4/14/25.
//

import Foundation

@MainActor
class CoinsViewModel: ObservableObject{
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        Task { try await fetchCoins() }
        
    }
    
    func fetchCoins() async throws {
        self.coins = try await service.fetchCoins()
    }
    
    func fetchCoinsWithCompletionHandler() {
        service.fetchCoinsWithResult(){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
}
