//
//  DeveloperPreview.swift
//  Airbnb_Clone
//
//  Created by Maxim Hranchenko on 23.10.2023.
//

import Foundation

final class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    var listings: [ListingResponse] = [
        .init(
            id: UUID().uuidString,
            images: ["crypto1", "crypto2"],
            ownerUid: UUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "sports1",
            numberOfBeds: 4,
            numberOfBathrooms: 3,
            numberOfBedRooms: 4,
            numberOfGuests: 4,
            pricePerNight: 400,
            latitude: 25.7850,
            longitude: -80.1936,
            adress: "124 Mian St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.77,
            feature: [.selfCheckIn, .superHost],
            amenities: [.alarmSystem, .kitchen, .laundry, .tv, .pool],
            type: .villa
        ),
        .init(
            id: UUID().uuidString,
            images: ["sports1", "sports2", "sports3"],
            ownerUid: UUID().uuidString,
            ownerName: "Olya Perchik",
            ownerImageUrl: "movies1",
            numberOfBeds: 3,
            numberOfBathrooms: 3,
            numberOfBedRooms: 3,
            numberOfGuests: 3,
            pricePerNight: 600,
            latitude: 23.6850,
            longitude: 90.3563,
            adress: "345 Bold St",
            city: "Bangladesh",
            state: "South Asia",
            title: "Bangladesh Home",
            rating: 5,
            feature: [.selfCheckIn],
            amenities: [.office, .kitchen, .wifi, .tv, .pool],
            type: .apartament
        ),
        .init(
            id: UUID().uuidString,
            images: ["movies1", "movies2", "movies3"],
            ownerUid: UUID().uuidString,
            ownerName: "Kuzya Puzya",
            ownerImageUrl: "crypto1",
            numberOfBeds: 8,
            numberOfBathrooms: 7,
            numberOfBedRooms: 8,
            numberOfGuests: 20,
            pricePerNight: 1400,
            latitude: 50.4500,
            longitude: 30.523333,
            adress: "Mian Street 555",
            city: "Kiev",
            state: "Ukraine",
            title: "Kiev Super",
            rating: 8.37,
            feature: [.selfCheckIn, .superHost],
            amenities: [.alarmSystem, .kitchen, .laundry, .tv, .pool, .wifi, .balcony, .office],
            type: .townHouse
        ),
        .init(
            id: UUID().uuidString,
            images: ["crypto3", "crypto1"],
            ownerUid: UUID().uuidString,
            ownerName: "Missy Pussy",
            ownerImageUrl: "sports3",
            numberOfBeds: 2,
            numberOfBathrooms: 2,
            numberOfBedRooms: 2,
            numberOfGuests: 8,
            pricePerNight: 200,
            latitude: 41.8818,
            longitude: -87.6231,
            adress: "999 Mian St",
            city: "Chicago",
            state: "USA",
            title: "Chicago House",
            rating: 3.77,
            feature: [.superHost],
            amenities: [.kitchen, .laundry, .tv, .pool],
            type: .house
        )
    ]
}
