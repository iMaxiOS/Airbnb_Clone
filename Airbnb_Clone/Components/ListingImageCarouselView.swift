//
//  ListingImageCarouselView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var isHiddenLike: Bool
    let item: ListingResponse
    
    init(isHiddenLike: Bool, item: ListingResponse) {
        self.isHiddenLike = isHiddenLike
        self.item = item
    }
    
    var body: some View {
        TabView {
            ForEach(item.images, id: \.self) { photo in
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
    ListingImageCarouselView(isHiddenLike: true, item: DeveloperPreview.instance.listings[2])
}
