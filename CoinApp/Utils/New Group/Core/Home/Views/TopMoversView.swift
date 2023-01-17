//
//  TopMoversView.swift
//  CoinApp
//
//  Created by ioannis on 13/1/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack (alignment:.leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal) {
                HStack(spacing:16) {
                    ForEach(viewModel.TopMovingcoins) { coin in
                        TopMoversItemView(coin:coin)
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
