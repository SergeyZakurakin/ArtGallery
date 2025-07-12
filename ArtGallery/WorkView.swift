//
//  WorkView.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/12/25.
//

import SwiftUI

struct WorkView: View {
    @State private var isShowingFullScreen: Bool = false
    let works: Work
    
    
    var body: some View {
        
       
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 287)
                    .frame(maxWidth: .infinity)
                    .background(
                        Image(works.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 287)
                            .clipped()
                    )
                
                VStack(alignment: .leading) {
                    Text("The Weeping Woman")
                    Text("The Weeping Woman, (60 х 49 cm, 23 ⅝ х 19 ¼ inches) is an oil on canvas painted by Pablo Picasso in France in 1937. Picasso was intrigued with the subject, and revisited the theme numerous times that year. This painting was the final and most elaborate of the series. It has been in the collection of the Tate in London since 1987, and is on exhibition at the Tate Modern, London.")
                }
                Spacer()
                
                Button {
                    isShowingFullScreen = true
                } label: {
                    //                HStack(alignment: .center, spacing: 10) { ... }
                    Rectangle()
                        .padding(.horizontal, 31)
                        .padding(.vertical, 11)
                        .frame(width: 335, height: 46, alignment: .center)
                        .background(.black)
                        .cornerRadius(10)
                }
                
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isShowingFullScreen) {
                WorkFullScreenView(image: works)
            }
        
        
    }
}

#Preview {
    WorkView(works: Work(title: "777", image: "", info: "77"))
}
