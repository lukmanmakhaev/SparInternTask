//
//  AmountBtn.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct AmountBtn: View {
    @ObservedObject var viewModel: ContentViewVM
    
    @Binding var quantity: Double
    @Binding var isInCart: Bool

    
    var body: some View {
        HStack {
            Button(action: {
                quantity -= 1
                if quantity < 1 {
                    isInCart = false
                }
                print(quantity)
            }, label: {
                Text("-")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.white)
            })
            .padding()
            
            VStack {
                Text("\(quantity.formatted())")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                
                Text("5,92")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.white.opacity(0.8))
            }
            
            Button(action: {
                quantity += 1
                print(quantity)
            }, label: {
                Text("+")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.white)
            })
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 34)
        .background(Color("buttonGreen"))
        .cornerRadius(40)
    }
}
