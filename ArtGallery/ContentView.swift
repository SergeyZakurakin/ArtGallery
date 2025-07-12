//
//  ContentView.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DataViewModel()
    @State private var search = ""
    
    
    var filteredArtists: [Artist] {
        guard !search.isEmpty else {
            return viewModel.artists
        }
        
        return viewModel.artists
            .filter { $0.name.localizedCaseInsensitiveContains(search) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredArtists, id: \.name) { artist in
                    NavigationLink {
                        BioView(artist: artist)
                    } label: {
                        HStack {
                            Image(artist.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 96, height: 96)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            VStack {
                                Text(artist.name)
                                    .foregroundStyle(.secondary)
                                Text(artist.bio)
                                    .lineLimit(2)
                                    .font(.subheadline.bold())
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $search, prompt: "Search")
            .navigationTitle("Artist")
            
        }
        .task {
            await viewModel.fetchData()
        }
     
    }
}

#Preview {
    ContentView()
}
