//
//  LocationsRow.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct LocationsRow: View {
    
    let location: LocationDetails
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(location.name)
                .font(.title3)
                .bold()
            Text("Residents: \(location.residents.count)")
                .font(.caption)
            
        }
        
    }
}
