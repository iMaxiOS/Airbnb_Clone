//
//  ExploreViewModel.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import Foundation

final class ExploreviewModel: ObservableObject {
    @Published var listings: [ListingResponse] = []
    
    private let manager: ExploreNetworkManager
    
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
