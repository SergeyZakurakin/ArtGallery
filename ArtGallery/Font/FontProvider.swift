//
//  FontProvider.swift
//  ArtGallery
//
//  Created by Sergey Zakurakin on 7/12/25.
//

import SwiftUI

public enum Inter: String {
    case inter = "Inter-regular"
}

extension View {
    func customFont(type: Inter, size: CGFloat = 16) -> some View {
        self
            .font(.custom(type.rawValue, size: size))
    }
}
