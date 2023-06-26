//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    let character: CharacterDetails
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        let specieColor = switch character.status {
            case .alive: Color.green
            case .dead: Color.red
            case .unknown: Color.gray
        }
        
        VStack(alignment: .leading) {
            
            HStack {
                
                AsyncImage(url: URL(string: character.image))
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 20)
                
                VStack(alignment: .leading) {
                    
                    Text(character.name)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Circle()
                            .foregroundStyle(specieColor)
                            .frame(width: 15, height: 15)
                        Text("\(character.status.rawValue) - \(character.species)")
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Last known location:")
                    Text("N/A")
                    
                    Text("First seen in:")
                    Text("N/A")
                    
                }
                .padding()
                
            }
            
            Divider()
            
            Section("Episodes") {
                List {
                    
                    ForEach(viewModel.characterEpisodes, id: \.self) { episode in
                        EpisodesRow(episode: episode)
                    }
                    
                }
            }
            
        }
        .navigationTitle(character.name)
        .padding()
        .onChange(of: character) {
            Task {
                await viewModel.getCharacterEpisodes(episodeURL: character.episode)
            }
        }
        
    }
}
