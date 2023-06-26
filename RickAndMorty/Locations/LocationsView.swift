//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                ForEach(viewModel.locations, id: \.self) { location in
                    NavigationLink(value: location) {
                        LocationsRow(location: location)
                    }
                }
                
            }
            .navigationTitle("Locations")
            .navigationDestination(for: LocationDetails.self) { location in
                LocationDetailsView(location: location)
            }
            
        } detail: {
            if let location = viewModel.locations.first {
                LocationDetailsView(location: location)
            }
        }
        .onAppear {
            Task {
                await viewModel.getLocations()
            }
        }
        
    }
}

#Preview {
    LocationsView()
}
