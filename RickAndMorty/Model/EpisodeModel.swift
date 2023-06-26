//
//  EpisodeModel.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import Foundation

// MARK: - Episode
struct Episode: Codable, Hashable {
    let results: [EpisodeDetails]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
}

// MARK: - EpisodeDetails
struct EpisodeDetails: Codable, Hashable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

