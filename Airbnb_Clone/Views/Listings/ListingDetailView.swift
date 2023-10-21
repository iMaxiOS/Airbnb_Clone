//
//  ExploreDetailView.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 21.10.2023.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(isHiddenLike: true)
                    .frame(height: 320)
                
                Button {
                    dissmis()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading) {
                VStack {
                    Text("Miami, Villa")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .font(.subheadline)
                            Text("4.85")
                                .fontWeight(.medium)
                            Text(" - ")
                            Text("28 reviews")
                                .underline()
                                .fontWeight(.semibold)
                        }
                        
                        Text("Miami, Florida")
                    }
                    .font(.caption)
                }
                .padding(.horizontal)
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire villa hosted by \nJohn Smith")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("4 guests - 4 bedrooms - 4 beds, 3 baths")
                    }
                    .font(.caption)
                    
                    Spacer()
                    
                    Image(.crypto1)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "doc.append.fill")
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("Self check-in")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text("Check yourself in with the keyboard")
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "figure.wave.circle")
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("Superhost")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experiences, highly rates hosts who are commited to providing greate stars for guests")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .font(.caption)
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Where you`ll sllep")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1 ..< 5, id: \.self) { item in
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(item)")
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 25)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1)
                                }
                            }
                        }
                        .padding(1)
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Whats this place offers")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "wifi")
                            .frame(width: 30)
                        Text("Wifi")
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "light.beacon.min.fill")
                            .frame(width: 30)
                        Text("Alart system")
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "building")
                            .frame(width: 30)
                        Text("Balcony")
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "magicmouse")
                            .frame(width: 30)
                        Text("Lundry")
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "tv")
                            .frame(width: 30)
                        Text("TV")
                    }
                }
                .font(.caption)
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Where you`ll be")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Map()
                        .frame(height: 250)
                        .clipShape(.rect(cornerRadius: 10))
                    
                }
                .font(.caption)
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 100)
        }
        .overlay(alignment: .bottom) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("$500")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("Total before taxes")
                        .font(.caption)
                    Text("Oct 15 - 22")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .underline()
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Reserve")
                        .font(.callout)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: 120, height: 40)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                }

            }
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(.white)
            .overlay(alignment: .top) {
                Divider()
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ListingDetailView()
}
