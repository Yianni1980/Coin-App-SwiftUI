//
//  AllCoinsView.swift
//  CoinApp
//
//  Created by ioannis on 14/1/23.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        VStack {
            Text("All Coins")
                .font(.headline)
            
            HStack{
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
        }
        
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
