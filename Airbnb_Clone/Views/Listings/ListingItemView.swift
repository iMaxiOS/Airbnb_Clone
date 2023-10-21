//
//  ListingView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    private var images = ["crypto1", "sports2", "movies2"]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(images, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .clipped()
                        
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 300)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(alignment: .topTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .padding(20)
                        .foregroundColor(.white)
                }
            }
            
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
                    .foregroundColor(.gray)
                Text("Nov 3 - 10")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("$567")
                    .bold() +
                Text(" night")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            
        }
    }
}

#Preview {
    ListingItemView()
}
