//
//  HomeViewModel.swift
//  CoinApp
//
//  Created by ioannis on 16/1/23.
//

import SwiftUI


//https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h


class HomeViewModel:ObservableObject {
    
    
    @Published var coins = [Coin]()
    @Published var TopMovingcoins = [Coin]()

    init () {
        fetchCoinData()
    }
    func fetchCoinData() {
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("DEBUG:Error\(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG:Response Code\(response.statusCode)")

            }
            guard let data = data else {return}
            do {
                let coins  = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configurteTopMovingCoins()
                    // print("DEBUG:\(coins)")

                }
            }catch let error {
                print("DeBUG: Failed to decode with error\(error)")
                
            }
             
            
            
        }.resume()
    }
    
    func configurteTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H
            
        })
        self.TopMovingcoins = Array(topMovers.prefix(5))
    }
    
     
}
