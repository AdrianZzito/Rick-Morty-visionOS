//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct CharacterView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var searchText = ""
    @State var isSearching = false
    
    var searchResults: [CharacterDetails] {
        if searchText.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.characters.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                ForEach(isSearching ? searchResults : viewModel.characters, id: \.self) { character in
                    NavigationLink(value: character) {
                        CharacterRow(character: character)
                    }
                }
                
            }
            .navigationTitle("Characters")
            .navigationDestination(for: CharacterDetails.self) { character in
                CharacterDetailView(character: character)
            }
            .searchable(text: $searchText, isPresented: $isSearching, prompt: "Search a character")
            
        } detail: {
            if let character = viewModel.characters.first {
                CharacterDetailView(character: character)
            }
        }
        .onAppear {
            Task {
                await viewModel.getCharacters()
            }
        }
        
    }
}

#Preview {
    CharacterView()
}
