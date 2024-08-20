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
    @State var isGridView = true
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 0)
        ]
    
    var body: some View {
        NavigationStack {
            Group {
                if isGridView {
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
                } else {
                    ScrollView (showsIndicators: false) {
                        ForEach($viewModel.products, id: \.self) { $product in
                            ListProductView(product: $product)
                                .environmentObject(viewModel)
                                
                            Divider()
                                .frame(height: 2)
                                .background(Color("divider"))
                        }
                    }
                }
            }
            .onChange(of: viewModel.products, {
                viewModel.saveCart()
            })
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.white)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        withAnimation(.spring()) {
                            isGridView.toggle()
                        }
                    }, label: {
                        Image(isGridView ? "gridIcon" : "listIcon")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .padding(11)
                            .background(.buttonGray)
                            .cornerRadius(12)
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
                            .padding(11)
                            .background(.buttonGray)
                            .cornerRadius(12)
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
