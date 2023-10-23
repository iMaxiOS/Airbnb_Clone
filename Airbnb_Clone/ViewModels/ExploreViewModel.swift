//
//  ExploreViewModel.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import Foundation

final class ExploreviewModel: ObservableObject {
    @Published var listings: [ListingResponse] = []
    @Published var searchTitle = ""
    
    private let manager: ExploreNetworkManager
    
    var searchCity: [ListingResponse] {
        if !searchTitle.isEmpty {
            return self.listings.filter {
                $0.city.lowercased().contains(searchTitle.lowercased()) ||
                $0.state.lowercased().contains(searchTitle.lowercased())
            }
        } else {
            return self.listings
        }
    }
    
    init(manager: ExploreNetworkManager) {
        self.manager = manager
        
        Task {
            await fetch()
        }
    }
    
    func fetch() async {
        do {
            listings = try await manager.fetch()
        } catch {
            print(error)
        }
    }
}
