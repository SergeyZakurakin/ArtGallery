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
            VStack() {
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
                    Text(works.title)
                        .font(.title)
                    Text(works.info)
                        
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                Spacer()
                
                Button {
                    isShowingFullScreen = true
                } label: {
                    Text("Full screen")
                        .frame(width: 200, height: 40)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black)
                        )
                        .padding()
                    
                }
                
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isShowingFullScreen) {
                WorkFullScreenView(image: works)
            }
        
        
    }
}

#Preview {
    WorkView(works: Work(title: "fsdafsdf", image: "1", info: "fasdfsdfsfsfdsafdfsddfsdfsadfasfdsfdsfsfdsfd"))
}
