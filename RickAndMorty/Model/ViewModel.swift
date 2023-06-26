//
//  ViewModel.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
    // MARK: - Character values
    @Published var characters: [CharacterDetails] = []
    @Published var characterEpisodes: [EpisodeDetails] = []
    
    // MARK: - Locations values
    @Published var locations: [LocationDetails] = []
    @Published var residents: [CharacterDetails] = []
    
    // MARK: - Episodes values
    @Published var episodes: [EpisodeDetails] = []
    @Published var episodeCharacters: [CharacterDetails] = []
    
    // MARK: - Characters
    func getCharacters() async {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        
        let (encodedCharacters, _) = try! await URLSession.shared.data(from: url!)
        let decodedCharacters = try! JSONDecoder().decode(Character.self, from: encodedCharacters)
        
        self.characters = decodedCharacters.results
        
    }
    
    func getCharacterEpisodes(episodeURL: [String]) async {
        
        characterEpisodes = []
        
        for episode in episodeURL {
            
            let url = URL(string: episode)
            
            let (encodedEpisode, _) = try! await URLSession.shared.data(from: url!)
            let decodedEpisode = try! JSONDecoder().decode(EpisodeDetails.self, from: encodedEpisode)
            
            self.characterEpisodes.append(decodedEpisode)
            
        }
        
    }
    
    // MARK: - Locations
    func getLocations() async {
        
        let url = URL(string: "https://rickandmortyapi.com/api/location")
        
        let (encodedLocations, _) = try! await URLSession.shared.data(from: url!)
        let decodedLocations = try! JSONDecoder().decode(Location.self, from: encodedLocations)
        
        self.locations = decodedLocations.results
        
    }
    
    func getResidents(characterURL: [String]) async {
        
        residents = []
        
        for character in characterURL {
            
            let url = URL(string: character)
            
            let (encodedCharacter, _) = try! await URLSession.shared.data(from: url!)
            let decodedCharacter = try! JSONDecoder().decode(CharacterDetails.self, from: encodedCharacter)
            
            self.residents.append(decodedCharacter)
            
        }
        
    }
    
    // MARK: - Episodes
    func getEpisodes() async {
        
        let url = URL(string: "https://rickandmortyapi.com/api/episode")
        
        let (encodedEpisodes, _) = try! await URLSession.shared.data(from: url!)
        let decodedEpisodes = try! JSONDecoder().decode(Episode.self, from: encodedEpisodes)
        
        self.episodes = decodedEpisodes.results
        
    }
    
    func getEpisodeCharacters(characterURL: [String]) async {
        
        episodeCharacters = []
        
        for character in characterURL {
            
            let url = URL(string: character)
            
            let (encodedCharacter, _) = try! await URLSession.shared.data(from: url!)
            let decodedCharacter = try! JSONDecoder().decode(CharacterDetails.self, from: encodedCharacter)
            
            self.episodeCharacters.append(decodedCharacter)
            
        }
        
    }
    
}
