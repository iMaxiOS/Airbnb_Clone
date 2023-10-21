//
//  ListingImageCarouselView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var isHiddenLike: Bool
    
    init(isHiddenLike: Bool) {
        self.isHiddenLike = isHiddenLike
    }
    
    private let images = ["crypto1", "sports2", "movies2"]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { photo in
                Image(photo)
                    .resizable()
                    .clipped()
                    
            }
        }
        .tabViewStyle(.page)
        .overlay(alignment: .topTrailing) {
            if !isHiddenLike {
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .padding(20)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    ListingImageCarouselView(isHiddenLike: true)
}
