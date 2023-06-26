//
//  Model.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import Foundation

// MARK: - Character
struct Character: Codable, Hashable {
    let results: [CharacterDetails]
}

// MARK: - CharacterDetails
struct CharacterDetails: Codable, Hashable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - CharacterLocation
struct CharacterLocation: Codable, Hashable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
