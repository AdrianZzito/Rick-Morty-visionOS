//
//  CharacterRow.swift
//  RickAndMorty
//
//  Created by Adrián Castilla on 25/6/23.
//

import SwiftUI

struct CharacterRow: View {
    
    let character: CharacterDetails
    
    var body: some View {
        
        let specieColor = switch character.status {
            case .alive: Color.green
            case .dead: Color.red
            case .unknown: Color.gray
        }
        
        HStack {
            
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
            
            AsyncImage(url: URL(string: character.image))
                .frame(width: 100, height: 100)
                .scaledToFit()
                .clipShape(Circle())
                .shadow(radius: 20)
            
        }
        
    }
}

