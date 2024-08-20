//
//  ProductItemImageSection.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 20.08.2024.
//

import SwiftUI

struct ProductItemImageSection: View {
    let image: String
    let message: ProductMessage?
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if let message = message {
                MessageSticker(message: message)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

