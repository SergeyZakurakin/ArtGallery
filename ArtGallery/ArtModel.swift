//
//  ArtModel.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/10/25.
//

import Foundation

struct ArtGallery: Decodable {
    let artists: [Artist]
}

struct Artist: Decodable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Decodable {
    let title: String
    let image: String
    let info: String
}


@MainActor
class DataViewModel: ObservableObject {
    
    @Published var artists: [Artist] = []
    
    func fetchData() async{
        guard let url = URL(string: "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json") else { return }
        do {
            let (data, _) = try! await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(ArtGallery.self, from: data)
            self.artists = decodedData.artists
            
        } catch {
            print("Error fetching decoded data: \(error)")
        }
    }
}
