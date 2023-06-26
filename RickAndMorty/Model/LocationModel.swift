//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import Foundation

// MARK: - Location
struct Location: Codable, Hashable {
    let results: [LocationDetails]
}

// MARK: - LocationDetails
struct LocationDetails: Codable, Hashable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
