//
//  ContentView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 20.10.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchAndFilterToggle = false
    
    var body: some View {
        NavigationStack {
            if searchAndFilterToggle {
                SearchAndFilterView(dismiss: $searchAndFilterToggle)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            searchAndFilterToggle.toggle()
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(0...10, id: \.self) { item in
                            NavigationLink(value: item) {
                                ListingItemView()                                
                            }
                        }
                    }
                    .padding()
                    .navigationDestination(for: Int.self) { item in
                        ListingDetailView()
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
