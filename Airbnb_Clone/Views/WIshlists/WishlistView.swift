//
//  WishlistView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists.")
                        .fontWeight(.semibold)
                    
                    Text("You can create, view or edit wishlists one you`ve logged in.")
                        .font(.footnote)
                }
                .padding(.horizontal)
                
                Button(action: {}, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 8))
                })
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView()
}
