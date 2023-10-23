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
    @State private var cameraPosition: MapCameraPosition
    
    let item: ListingResponse
    
    init(item: ListingResponse) {
        self.item = item
        
        let center = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        let region = MKCoordinateRegion(
            center: center,
            span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(wrappedValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(isHiddenLike: true, item: item)
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
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .font(.subheadline)
                            Text(item.rating.description)
                                .fontWeight(.medium)
                            Text(" - ")
                            Text("28 reviews")
                                .underline()
                                .fontWeight(.semibold)
                        }
                        
                        Text("\(item.title) \(item.state)")
                    }
                    .font(.caption)
                }
                .padding(.horizontal)
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entire \(item.type.description) hosted by \n\(item.ownerName)")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("\(item.numberOfGuests) guests - \(item.numberOfBedRooms) bedrooms - \(item.numberOfBeds) beds, \(item.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                    
                    Spacer()
                    
                    Image(item.ownerImageUrl)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(item.feature) { item in
                        HStack {
                            Image(systemName: item.imageName)
                                .font(.title3)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                
                                Text(item.subtitle)
                                    .foregroundStyle(.gray)
                            }
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
                            ForEach(1 ..< item.numberOfBeds, id: \.self) { item in
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
                    
                    ForEach(item.amenities) { item in
                        HStack(spacing: 4) {
                            Image(systemName: item.imageName)
                                .frame(width: 30)
                            Text(item.title)
                        }
                    }
                }
                .font(.caption)
                .padding()
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Where you`ll be")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Map(position: $cameraPosition)
                        .frame(height: 250)
                        .clipShape(.rect(cornerRadius: 10))
                        .disabled(true)
                    
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
                    Text("$\(item.pricePerNight)")
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
        .statusBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ListingDetailView(item: DeveloperPreview.instance.listings[2])
}
