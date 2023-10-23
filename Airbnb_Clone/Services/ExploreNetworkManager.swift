//
//  ExploreNetworkManager.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import Foundation

final class ExploreNetworkManager {
    func fetch() async throws -> [ListingResponse] {
        return DeveloperPreview.instance.listings
    }
}
