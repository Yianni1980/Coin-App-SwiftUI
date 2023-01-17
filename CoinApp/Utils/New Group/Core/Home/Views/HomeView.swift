//
//  HomeView.swift
//  CoinApp
//
//  Created by ioannis on 13/1/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()   
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                
                
                //top movers view
                TopMoversView(viewModel: viewModel)
                //all coins view
                AllCoinsView(viewModel: viewModel)

            }
            .navigationTitle("Live Prices")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
