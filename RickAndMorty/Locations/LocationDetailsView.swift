//
//  LocationDetailsView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct LocationDetailsView: View {
    
    let location: LocationDetails
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.title)
                        .bold()
                    Text("Residents: \(location.residents.count)")
                        .font(.caption)
                }
                
                Text("Dimension: \(location.dimension)")
            }
            
            Divider()
            
            Section("Residents") {
                
                List {
                    ForEach(viewModel.residents, id: \.self) { resident in
                        CharacterRow(character: resident)
                    }
                }
                
            }
            
        }
        .padding()
        .navigationTitle(location.name)
        .onChange(of: location) {
            Task {
                await viewModel.getResidents(characterURL: location.residents)
            }
        }
        
    }
}
