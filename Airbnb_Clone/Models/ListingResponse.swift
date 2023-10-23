//
//  ListingResponse.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import Foundation

struct ListingResponse: Identifiable, Codable, Hashable {
    let id: String
    let images: [String]
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBeds: Int
    let numberOfBathrooms: Int
    let numberOfBedRooms: Int
    let numberOfGuests: Int
    let pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let adress: String
    let city: String
    let state: String
    let title: String
    let rating: Double
    var feature: [ListingFeature]
    var amenities: [ListingAmenities]
    let type: ListingType
}

enum ListingFeature: Int, Identifiable, Hashable, Codable {
    case selfCheckIn, superHost
    
    var id: Int { return self.rawValue }
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: return "Self Check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn: return "Check yourself in with the keypad."
        case .superHost: return "Superhosts are experiences, highly rates hosts who are commited to providing greate stars for guests."
        }
    }
}

enum ListingAmenities: Int, Identifiable, Hashable, Codable {
    case pool, kitchen, wifi, laundry, tv, alarmSystem, office, balcony
    
    var id: Int { return self.rawValue }
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alart system"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "network.badge.shield.half.filled"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
}

enum ListingType: Int, Identifiable, Hashable, Codable {
    case apartament, house, townHouse, villa
    
    var id: Int { return self.rawValue }
    
    var description: String {
        switch self {
        case .apartament: return "Apartament"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
}
