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
            ZStack {
                Image(artist.image)
                    .resizable()
                    .scaledToFit()
//                    .frame(height: 384)
//                    .frame(maxWidth: .infinity)
                    .clipped()
                  
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(artist.name)
                            .foregroundStyle(.white)
                            .font(.headline)
                        Text("Author")
                            .foregroundStyle(.white).opacity(0.7)
                    }
                     
                    Spacer()
                }
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
              
            }
            VStack(alignment: .leading, spacing: 20) {
//            .frame(height: 384)

            Text("Biography")
                    .font(.title)
               
            Text(artist.bio)
                
                .frame(maxWidth: .infinity)
                
              
            Text("Works")
                    .font(.title)
                ForEach(artist.works, id: \.title) { work in
                    NavigationLink {
                        WorkView(works: work)
                    } label: {
                        VStack(alignment: .leading) {
                            // TO DO CORNERS
                            Image(work.image)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 11))
                                
                            Text(work.title)
                                .foregroundStyle(.black)
                                .customFont(type: .inter, size: 16)
                        }
                    }
            }
        }
            .padding(.horizontal, 20)
        }
       
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    let mockWorks = [
        Work(title: "Sunset", image: "Georgia1", info: "A beautiful sunset over the hills."),
        Work(title: "Forest", image: "Georgia2", info: "A mysterious forest path.")
    ]

    let mockArtist = Artist(
        name: "Vincent van Gogh",
        bio: "Dutch post-impressionist painter known for expressive works.Dutch post-impressionist painter known for expressive works.Dutch post-impressionist painter known for expressive works.",
        image: "2",
        works: mockWorks
    )

    return BioView(artist: mockArtist)
}
