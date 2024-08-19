//
//  AddToCartBtn.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct AddToCartBtn: View {
    @ObservedObject var viewModel: ContentViewVM
    
    @Binding var width: CGFloat
    @Binding var isInCart: Bool
    @Binding var quantity: Double
    
    var body: some View {
        Button(action: {
            isInCart.toggle()
            quantity += 1
            print(quantity)
        }, label: {
            Image("cart")
                .resizable()
                .scaledToFit()
                .frame(height: 14)
        })
        .frame(width: width, height: 36)
        .background(Color("buttonGreen"))
        .cornerRadius(40)
    }
}
