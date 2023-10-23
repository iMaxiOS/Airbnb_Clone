//
//  SearchAndFilterView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct SearchAndFilterView: View {
    
    @Binding var dismiss: Bool
    @Binding var searchTitle: String
    
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        dismiss.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .font(.title2)
                })
                
                Spacer()
                
                if searchTitle != "" {
                    Button(action: {
                        searchTitle = ""
                    }, label: {
                        Text("Clear")
                            .font(.headline)
                    })
                }
            }
            .foregroundColor(.black)
            .padding(.bottom, 25)
            
            DestinationSearchView(searchTitle: $searchTitle, dismiss: $dismiss)
            
            Spacer()
        }
        .padding(.horizontal)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchAndFilterView(dismiss: .constant(true), searchTitle: .constant("Miami"))
}
