//
//  EpisodesDetailView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct EpisodesDetailView: View {
    
    let episode: EpisodeDetails
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(episode.name)
                .font(.title)
                .bold()
            Text(episode.airDate)
                .font(.caption)
            Text("Episode code: \(episode.episode)")
                .font(.caption)
            
            Divider()
            
            Section("Characters") {
                
                List {
                    ForEach(viewModel.episodeCharacters, id: \.self) { character in
                        CharacterRow(character: character)
                    }
                }
                
            }
            
        }
        .padding()
        .navigationTitle(episode.name)
        .onChange(of: episode) {
            Task {
                await viewModel.getEpisodeCharacters(characterURL: episode.characters)
            }
        }
        
    }
}

