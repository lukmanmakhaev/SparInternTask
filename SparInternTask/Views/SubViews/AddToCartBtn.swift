//
//  AddToCartBtn.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct AddToCartBtn: View {
    @Binding var product: Product
    var body: some View {
        Button(action: {
            addProduct(type: product.unitType)
        }, label: {
            Image("cart")
                .resizable()
                .scaledToFit()
                .frame(height: 14)
        })
        .frame(width: 48, height: 36)
        .background(Color("buttonGreen"))
        .cornerRadius(40)
    }
    
    func addProduct(type: UnitType) {
        switch type {
        case .kilogram:
            product.quantity += 0.1
        case .piece:
            product.quantity += 1
        }
    }
}
