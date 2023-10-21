//
//  ListingView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    var body: some View {
        VStack {
            ListingImageCarouselView(isHiddenLike: false)
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                HStack(spacing: 5) {
                    Text("Crypto future")
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .font(.subheadline)
                    Text("4.85")
                        .fontWeight(.medium)
                }
                
                Text("12 mi away")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Text("Nov 3 - 10")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                
                Text("$567")
                    .bold() +
                Text(" night")
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    ListingItemView()
}
