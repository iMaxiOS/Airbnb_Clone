//
//  WhereToView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI

enum DestinationLocationType {
    case location, date, guest
}

struct DestinationSearchView: View {
    
    @State private var numGuests = 0
    @State private var fromDate = Date()
    @State private var toDate = Date()
    @State private var selectedType: DestinationLocationType = .location
    
    @Binding var textSearch: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            VStack {
                if selectedType == .location {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            TextField("Search destinations...", text: $textSearch)
                        }
                        .padding(.horizontal)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                    }
                } else {
                    CollupsedPickerView(title: "Where", destination: "Add location")
                }
            }
            .modifier(CollupsedDestinationViewModifier())
            .frame(height: selectedType == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedType = .location
                }
            }
            
            VStack {
                if selectedType == .date {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("When`s your tip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        VStack {
                            DatePicker("From", selection: $fromDate, displayedComponents: .date)
                                .tint(.black)
                            
                            Divider()
                            
                            HStack {
                                DatePicker("To", selection: $toDate, displayedComponents: .date)
                                    .tint(.black)
                            }
                        }
                    }
                } else {
                    CollupsedPickerView(title: "When", destination: "Add dates")
                }
            }
            .modifier(CollupsedDestinationViewModifier())
            .frame(height: selectedType == .date ? 160 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedType = .date
                }
            }
            
            VStack {
                if selectedType == .guest {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Who`s coming?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Stepper {
                            Text("\(numGuests) Adults")
                        } onIncrement: {
                            guard numGuests < 99 else { return }
                            numGuests += 1
                        } onDecrement: {
                            guard numGuests > 0 else { return }
                            numGuests -= 1
                        }

                    }
                } else {
                    CollupsedPickerView(title: "Who", destination: "Add guests")
                }
            }
            .modifier(CollupsedDestinationViewModifier())
            .frame(height: selectedType == .guest ? 110 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedType = .guest
                }
            }
        }
    }
}

//MARK: - CollupsedPickerView
struct CollupsedPickerView: View {
    let title: String
    let destination: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(destination)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

//MARK: - CollupsedDestinationViewModifier
struct CollupsedDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
}

#Preview {
    DestinationSearchView(textSearch: .constant(""), show: .constant(false))
}
