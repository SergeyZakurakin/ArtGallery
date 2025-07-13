//
//  AddArtistView.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/12/25.
//

import SwiftUI
import PhotosUI

struct AddArtistView: View {
    @State private var name: String = ""
    @State private var bio: String = ""
    @State private var artistImage: UIImage?
    @State private var title: String = ""
    @State private var artImage: UIImage?
    @State private var info: String = ""
    
    @State private var artistPhoto: PhotosPickerItem?
    @State private var artPhoto: PhotosPickerItem?
    
    var body: some View {
        ScrollView {
            
            Text("Name")
            TextField( "Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Text("Bio")
            TextField( "Enter name", text: $bio)
                .textFieldStyle(.roundedBorder)
            
            Text("Artist Photo")
            PhotosPicker(selection: $artistPhoto) {
                Image(uiImage: artistImage ?? UIImage(resource: ._0))
                    .resizable()
                    .frame(width: 100, height:  100)
            }
            
            Text("Art name")
            TextField( "Enter name", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Text("Art Picture")
            PhotosPicker(selection: $artPhoto) {
                Image(uiImage: artImage ?? UIImage(resource: ._0))
                    .resizable()
                    .frame(width: 100, height:  100)
            }
            
            Text("Art Description")
            TextField( "Enter name", text: $info)
                .textFieldStyle(.roundedBorder)
            
        }
        .onChange(of: artistPhoto) { _, _ in
            Task {
                if let artistPhoto,
                   let data = try? await artistPhoto.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        artistImage = image
                       
                    }
                }
            }
            
        }
        .onChange(of: artistPhoto) { _, _ in
            Task {
                if let artPhoto,
                   let data = try? await artPhoto.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        artImage = image
                       
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    AddArtistView()
}


/*
 
 Добавление данных:
 Реализовать форму добавления новых художников и их картин.
 Форма должна содержать поля для имени художника, биографии, фотографии, а также полей для добавления картин (название, изображение, описание).
 Данные сохраняются локально.
 
 
 
 */
