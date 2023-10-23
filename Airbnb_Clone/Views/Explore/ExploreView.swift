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
                SearchAndFilterView(
                    dismiss: $searchAndFilterToggle, 
                    searchTitle: $vm.searchTitle
                )
            } else {
                ScrollView {
                    SearchAndFilterBar(searchTitle: $vm.searchTitle)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                searchAndFilterToggle.toggle()
                            }
                        }
                    
                    if !vm.searchCity.isEmpty {
                        LazyVStack(spacing: 32) {
                            ForEach(vm.searchCity) { item in
                                NavigationLink(value: item) {
                                    ListingItemView(item: item)
                                }
                            }
                        }
                        .padding()
                        .navigationDestination(for: ListingResponse.self) { item in
                            ListingDetailView(item: item)
                        }
                    } else {
                        ContentUnavailableView(label: {
                            Label("The \(vm.searchTitle) won't find.", systemImage: "magnifyingglass")
                        }, description: {
                            Text("You can try to find enother city..")
                        })
                        .padding(.top, 150)
                    }
                }
                .scrollDisabled(vm.searchCity.isEmpty)
            }
        }
    }
}

#Preview {
    ExploreView()
}
