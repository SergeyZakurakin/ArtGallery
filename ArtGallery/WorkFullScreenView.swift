//
//  WorkFullScreenView.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/12/25.
//

import SwiftUI

struct WorkFullScreenView: View {
    @Environment(\.dismiss) private var dismiss
    
        let image: Work
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Image(image.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: geometry.size.height,
                        height: geometry.size.width
                    )
                    .rotationEffect(.degrees(-90))
                    .offset(x: (geometry.size.width - geometry.size.height) / 2,
                            y: (geometry.size.height - geometry.size.width) / 2)
            }
            .ignoresSafeArea()
            
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(.addCircle)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(45))
                }
            }
            .padding(40)

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let work: Work = .init(title: "", image: "0", info: ")")
    
    WorkFullScreenView(image: work)
}






/*
 Rectangle()
 .foregroundColor(.clear)
 .frame(width: 543, height: 373.58401)
 .background(
 Image("PATH_TO_IMAGE")
 .resizable()
 .aspectRatio(contentMode: .fill)
 .frame(width: 543, height: 373.5840148925781)
 .clipped()
 )
 .rotationEffect(Angle(degrees: -90))

*/
