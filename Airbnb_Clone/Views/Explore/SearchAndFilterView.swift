//
//  SearchAndFilterView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct SearchAndFilterView: View {
    
    @State private var showClearButton = false
    @State private var textSearch = ""
    
    @Binding var dismiss: Bool
    
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
                
                if textSearch != "" {
                    Button(action: {
                        textSearch = ""
                    }, label: {
                        Text("Clear")
                            .font(.headline)
                    })
                }
            }
            .foregroundColor(.black)
            .padding(.bottom, 25)
            
            DestinationSearchView(textSearch: $textSearch, show: $showClearButton)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchAndFilterView(dismiss: .constant(true))
}
