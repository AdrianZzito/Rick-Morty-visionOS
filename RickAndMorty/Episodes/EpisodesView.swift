//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct EpisodesView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                ForEach(viewModel.episodes, id: \.self) { episode in
                    NavigationLink(value: episode) {
                        EpisodesRow(episode: episode)
                    }
                }
                
            }
            .navigationTitle("Episodes")
            .navigationDestination(for: EpisodeDetails.self) { episode in
                EpisodesDetailView(episode: episode)
            }
            
        } detail: {
            if let episode = viewModel.episodes.first {
                EpisodesDetailView(episode: episode)
            }
        }
        .onAppear {
            Task {
                await viewModel.getEpisodes()
            }
        }
        
    }
}

#Preview {
    EpisodesView()
}
