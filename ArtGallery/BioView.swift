//
//  BioView.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/10/25.
//

import SwiftUI

struct BioView: View {
    let artist: Artist
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            ZStack {
                Image(artist.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 384)
                    .frame(maxWidth: .infinity)
                    .clipped()
                  
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(artist.name)
                            .foregroundStyle(.white)
                            .font(.headline)
                        Text("Author")
                            .foregroundStyle(.gray)
                    }
                    
                    .padding(.bottom, 40)
                    Spacer()
                }
            }
            .frame(height: 384)

            Text("Biography")
                .font(.title2.bold())
            Text(artist.bio)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
            Text("Works")
                .font(.title2.bold())
                ForEach(artist.works, id: \.title) { work in
                    NavigationLink {
                        WorkView(works: work)
                    } label: {
                        VStack(alignment: .leading) {
                            Image(work.image)
                                .resizable()
                            Text(work.title)
                                .foregroundStyle(.black)
                        }
                    }
            }
        }
        
        
            
                
            
        }
       
        .ignoresSafeArea()
    }
}

#Preview {
    let mockWorks = [
        Work(title: "Sunset", image: "sunset_image", info: "A beautiful sunset over the hills."),
        Work(title: "Forest", image: "forest_image", info: "A mysterious forest path.")
    ]

    let mockArtist = Artist(
        name: "Vincent van Gogh",
        bio: "Dutch post-impressionist painter known for expressive works.Dutch post-impressionist painter known for expressive works.Dutch post-impressionist painter known for expressive works.",
        image: "0",
        works: mockWorks
    )

    return BioView(artist: mockArtist)
}
