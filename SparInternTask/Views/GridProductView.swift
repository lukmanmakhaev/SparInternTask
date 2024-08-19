//
//  GridProductView.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import SwiftUI

struct GridProductView: View {
    @ObservedObject var viewModel: ContentViewVM
    @State var product: Product
    
    @State var selectedType: UnitType
    @State var cartBtnWidth: CGFloat = 48
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
            //topSection
            ProductItemImageSection(image: product.image, message: product.message, rating: product.rating, discount: product.discount)
            
            //bottomSection
            VStack  {
                VStack (alignment: .leading) {
                    
                    Text("Салат Овощной с Крабовыми Палочками")
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
                        
                        Picker("UnitType", selection: $selectedType) {
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
                                    Text("99.90")
                                        .font(.system(size: 20, weight: .bold))
                                    Image("peram")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                
                                
                                Text("199,0")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                                    .strikethrough(true)
                            }
                            .padding(.leading, 4)
                            Spacer()
                        }
                        
                    
                        if product.isInCart && product.quantity > 0 {
                            AmountBtn(viewModel: viewModel, quantity: $product.quantity, isInCart: $product.isInCart)
                        } else {
                            AddToCartBtn(viewModel: viewModel, width: $cartBtnWidth, isInCart: $product.isInCart, quantity: $product.quantity)
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
        GridProductView(viewModel: ContentViewVM(), product: Product(id: UUID(), name: "Салат Овощной с Крабовыми Палочками", image: "1", cost: 99.90, quantity: 0, rating: 4.1, originalPrice: 199.90, unitType: [.kilogram, .piece], message: .bigSale, discount: 0.25, country: "Франция", isFavorite: false, isInCart: false), selectedType: .kilogram)
            .frame(width: 168, height: 278)
            .shadow(color: Color("cardShadow").opacity(0.2), radius: 8)
    }
}



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
