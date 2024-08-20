//
//  ContentView.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ContentViewVM
    
    @State var cartIsPresented = false
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 0)
        ]
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach($viewModel.products, id: \.self) { $product in
                        GridProductView(product: $product)
                            .shadow(color: Color("cardShadow").opacity(0.2), radius: 8)
                            .environmentObject(viewModel)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
            }
            .onChange(of: viewModel.products, {
                viewModel.saveCart()
                print("fff")
            })
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}, label: {
                        Image("gridIcon")
                            .resizable()
                            .frame(width: 16, height: 16)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        cartIsPresented.toggle()
                    }, label: {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color("buttonGreen"))
                            .fontWeight(.bold)
                    })
                    .sheet(isPresented: $cartIsPresented, content: {
                        CartView()
                            .environmentObject(viewModel)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView(cartIsPresented: false)
        .environmentObject(ContentViewVM())
}
