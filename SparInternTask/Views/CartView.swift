//
//  CartView.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: ContentViewVM
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 0)
        ]
    
    var body: some View {
        VStack {
            Button("Clean Cart", action: {
                viewModel.cleanCart()
            })
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach($viewModel.products.filter { $0.quantity.wrappedValue  > 0 }) { $product in
                        GridProductView(product: $product)
                            .shadow(color: Color("cardShadow").opacity(0.2), radius: 8)
                            .environmentObject(viewModel)

                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
            }
        }
    }
}

//#Preview {
//    CartView(cart: .constant(T##value: [Product]##[Product]))
//        .environmentObject(ContentViewVM())
//}
