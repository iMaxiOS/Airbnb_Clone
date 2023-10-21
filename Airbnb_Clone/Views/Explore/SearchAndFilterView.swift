//
//  SearchAndFilterView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

struct SearchAndFilterView: View {
    @Binding var dismiss: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .font(.title2)
                        .padding(4)
                })
                
                Spacer()
                
                Button(action: {
                    dismiss.toggle()
                }, label: {
                    Text("Clear")
                        .font(.headline)
                        .padding(4)
                })
            }
            .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchAndFilterView(dismiss: .constant(true))
}
