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
    let rating: Double?
    let discount: Double?
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, minHeight: 148)
            
            VStack {
                Spacer()
                
                HStack (spacing: 4) {
                    Image("starIcon")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    
                    Text("\(rating ?? 0, specifier: "%.1f")")
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    if let discount = discount {
                        Text("\(discount * 100, specifier: "%.0f")%")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color("discountText"))
                    }
                }
            }
            .padding(.horizontal, 8)
            
            if let message = message {
                MessageSticker(message: message)
            }
            
            VStack {
                Button(action: {}, label: {
                    Image("receipt")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .padding(8)
                })
                
                Button(action: {}, label: {
                    Image("heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .padding(8)
                })
            }
            .background(.white.opacity(0.8))
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxHeight: .infinity)
    }
}

