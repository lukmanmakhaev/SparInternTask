//
//  GridProductView.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import SwiftUI

struct GridProductView: View {
    @Binding var product: Product
    @State var cartBtnWidth: CGFloat = 48
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            ProductItemImageSection(image: product.image, message: product.message, rating: product.rating, discount: product.discount)
            
            VStack  {
                VStack (alignment: .leading) {
                    
                    Text(product.name)
                        .font(.caption)
                        .lineLimit(2)

                    if !product.isInCart {
                        Text(product.country ?? "")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(4)
                
                VStack (spacing: 4) {
                    if product.isInCart {
                        Picker("", selection: $product.unitType) {
                            ForEach(UnitType.allCases, id: \.self) { unitType in
                                Text(unitType.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    HStack (alignment: .bottom) {
                        if !product.isInCart {
                            VStack (alignment: .leading, spacing: 0) {
                                HStack (spacing: 2){
                                    Text("\(product.cost, specifier: "%.2f")")
                                        .font(.system(size: 20, weight: .bold))
                                        .minimumScaleFactor(0.5)
                                        .lineLimit(1)
                                    
                                    Image("peram")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                
                                if let oldPrice = product.originalPrice {
                                    Text("\(oldPrice, specifier: "%.1f")")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                        .strikethrough(true)
                                }
                            }
                            .padding(.leading, 4)
                            Spacer()
                        }
                        
                        if product.isInCart && product.quantity > 0 {
                            AmountBtn(product: $product)
                               
                        } else {
                            AddToCartBtn(width: $cartBtnWidth, product: $product)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .padding(4)
        }
        .background()
        .frame(width: 168, height: 278)
        .cornerRadius(20)
    }
}

struct GridProductView_Previews: PreviewProvider {
    static var previews: some View {
        GridProductView(product: .constant(Product(id: "1", name: "Салат Овощной с Крабовыми Палочками", image: "1", cost: 95699.90, quantity: 0, rating: 4.1, originalPrice: 199.90, unitType: .kilogram, message: .bigSale, discount: 0.25, country: "Франция", isFavorite: false)))
            .frame(width: 168, height: 278)
            .shadow(color: Color("cardShadow").opacity(0.2), radius: 8)
            .environmentObject(ContentViewVM())
        
    }
}
