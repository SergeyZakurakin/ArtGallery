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
                            VStack(alignment: .leading, spacing: 8) {
                                Text(artist.name)
                                    .foregroundStyle(.secondary)
                                    .customFont(type: .inter, size: 14)
                                Text(artist.bio)
                                    .lineLimit(2)
                                    .customFont(type: .inter, size: 16)
                                    .font(.subheadline.bold())
                                    }
                            .padding(18)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $search, prompt: "Search")
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Text("Artists")
                        .customFont(type: .inter, size: 24)
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // действие по кнопке
                        print("Плюс нажали")
                    }) {
                        Image(.addCircle)
                            .frame(width: 24, height: 24)
                    }
                }
            }
            
        }
        .task {
            await viewModel.fetchData()
        }
     
    }
}

#Preview {
    ContentView()
}
