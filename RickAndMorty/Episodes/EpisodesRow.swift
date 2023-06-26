//
//  EpisodesRow.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct EpisodesRow: View {
    
    let episode: EpisodeDetails
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(episode.name)
                .font(.title3)
                .bold()
            Text(episode.airDate)
                .font(.caption)
            
        }
        
    }
}

