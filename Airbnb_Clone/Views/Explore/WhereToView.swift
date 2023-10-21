//
//  WhereToView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct WhereToView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where to?")
                
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Miami")
                    .bold()
            }
            .padding(.horizontal)
            .frame(height: 45)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black, lineWidth: 1)
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(color: .gray, radius: 4, x: 0, y: 0)
        .padding()
    }
}

#Preview {
    WhereToView()
}
