//
//  ListProductView.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 20.08.2024.
//

import SwiftUI

struct ListProductView: View {
    @Binding var product: Product
    
    var body: some View {
        HStack (spacing: 0) {
            
            ZStack (alignment: .bottomTrailing) {
                ProductItemImageSection(image: product.image, message: product.message)
                
                if let discount = product.discount {
                    Text("\(discount * 100, specifier: "%.0f")%")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color("discountText"))
                        .padding(.horizontal, 5)
                }
            }
            .frame(width: 144, height: 144)
            .cornerRadius(8)
            .padding(.leading, 8)
            
            ZStack (alignment: .topTrailing) {
                VStack  {
                    HStack (spacing: 4) {
                        Image("starIcon")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 12, height: 12)
                        
                        Text("\(product.rating ?? 0, specifier: "%.1f")")
                        
                        Text("|")
                            .foregroundColor(.gray)
                        Text("19 отзывов")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12))
                    
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
                    
                    VStack (spacing: 4) {
                        if product.isInCart {
                            Picker("", selection: $product.unitType) {
                                ForEach(UnitType.allCases, id: \.self) { unitType in
                                    Text(unitType.rawValue)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        HStack (alignment: .center) {
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
                                AddToCartBtn(product: $product)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Button(action: {}, label: {
                        Image("receipt")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16, height: 16)
                            .padding(8)
                    })
                    
                    Button(action: {
                        product.isFavorite.toggle()
                    }, label: {
                        Image(product.isFavorite ? "heart.fill" : "heart")
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
            .padding([.leading, .vertical], 8)
        }
        .padding(8)
        .background()
        .frame(height: 176)
    }
}

#Preview {
    ListProductView(product: .constant(Product(id: "1", name: "Салат Овощной с Крабовыми Палочками", image: "3", cost: 95699.90, quantity: 0, rating: 4.1, originalPrice: 199.90, unitType: .kilogram, message: .bigSale, discount: 0.25, country: "Франция", isFavorite: false)))
}

