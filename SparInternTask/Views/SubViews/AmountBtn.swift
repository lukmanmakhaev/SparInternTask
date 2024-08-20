//
//  AmountBtn.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct AmountBtn: View {
    @Binding var product: Product
    
    var body: some View {
        HStack {
            Button(action: {
                removeProduct(type: product.unitType)
                print(product.quantity)
            }, label: {
                Text("-")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.white)
            })
            .padding()
            
            VStack {
                Text("\(product.quantity, specifier: product.specifier)")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                
                Text("5,92")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.white.opacity(0.8))
            }
            
            Button(action: {
                addProduct(type: product.unitType)
                print(product.quantity)
            }, label: {
                Text("+")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.white)
            })
            .padding()
        }
        .frame(height: 36)
        .frame(maxWidth: .infinity)
        .background(Color("buttonGreen"))
        .cornerRadius(40)
    }
    
    
    func addProduct(type: UnitType) {
        switch type {
        case .kilogram:
            product.quantity += 0.1
        case .piece:
            product.quantity = Double(Int(product.quantity)) + 1
        }
    }
    
    func removeProduct(type: UnitType) {
        switch type {
        case .kilogram:
            product.quantity -= 0.1
        case .piece:
            product.quantity = Double(Int(product.quantity)) - 1
        }
    }
}
