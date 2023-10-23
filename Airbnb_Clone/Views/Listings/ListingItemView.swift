//
//  ListingView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    let item: ListingResponse
    
    var body: some View {
        VStack {
            ListingImageCarouselView(isHiddenLike: false, item: item)
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Text("\(item.city), \(item.state)")
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .font(.subheadline)
                    Text("\(item.rating)")
                        .fontWeight(.medium)
                }
                
                Text("12 mi away")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Text("Nov 3 - 10")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Text("$\(item.pricePerNight)")
                    .bold() +
                Text(" night")
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    ListingItemView(item: DeveloperPreview.instance.listings[0])
}
