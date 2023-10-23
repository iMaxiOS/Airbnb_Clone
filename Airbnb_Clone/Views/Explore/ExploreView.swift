//
//  ContentView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 20.10.2023.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var vm = ExploreviewModel(manager: ExploreNetworkManager())
    
    
    @State private var searchAndFilterToggle = false
    
    var body: some View {
        NavigationStack {
            if searchAndFilterToggle {
                SearchAndFilterView(dismiss: $searchAndFilterToggle)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                searchAndFilterToggle.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(vm.listings) { item in
                            NavigationLink(value: item) {
                                ListingItemView(item: item)
                            }
                        }
                    }
                    .padding()
                    .navigationDestination(for: ListingResponse.self) { item in
                        ListingDetailView(item: item)
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
