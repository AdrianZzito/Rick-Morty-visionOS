//
//  SelectorView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct SelectorView: View {
    
    @State var selected = 1
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        TabView(selection: $selected) {
            
            CharacterView()
                .tabItem { Label("Characters", systemImage: "person") }
                .tag(1)
            
            LocationsView()
                .tabItem { Label("Locations", systemImage: "location") }
                .tag(2)
            
            EpisodesView()
                .tabItem { Label("Episodes", systemImage: "bookmark") }
                .tag(3)
            
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    SelectorView()
}
