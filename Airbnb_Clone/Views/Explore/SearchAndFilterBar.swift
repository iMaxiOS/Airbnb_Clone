//
//  SearchAndFilterBar.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Miami")
                    .font(.headline)
                Text("Any Week - Add guests")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .background(Color.white.opacity(0.00001))
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 1)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
