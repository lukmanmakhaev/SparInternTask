//
//  ContentViewVM.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import Foundation

final class ContentViewVM: ObservableObject {

    @Published var cart: [Product] = []
    
    @Published var products = [
    Product(id: UUID(), name: "сыр Ламбер 500/0 230г", image: "1", cost: 99.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .bigSale, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Энергетический Напит", image: "2", cost: 95699.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Салат Овощной с Крабовыми Палочками", image: "3", cost: 250.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Дорадо Охлажденная Непотрошеная 300-400г", image: "4", cost: 59.20, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: 25, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Ролл Маленькая Япония 216г", image: "5", cost: 367.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .newProduct, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Огурцы тепличные cадово-огородные", image: "6", cost: 59.20, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .cardPrice, discount: nil, country: "Франция🇫🇷", isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Манго Кео", image: "7", cost: 1298, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram] , message: .newProduct, discount: 25, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Салат Овощной с Крабовыми Палочками", image: "8", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Салат Овощной с Крабовыми Палочками", image: "9", cost: 1928.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Масло Слобода Рафинированное 1,8л", image: "10", cost: 1298.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .bigSale, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Салат Овощной с Крабовыми Палочками", image: "11", cost: 250.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: "Франция🇫🇷", isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Макаронные Изделия SPAR Спагетти 450г", image: "12", cost: 2600.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .newProduct, discount: nil, country: nil, isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Огурцы тепличные cадово-огородные", image: "13", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: nil, discount: nil, country: "Франция🇫🇷", isFavorite: false, isInCart: false),
    Product(id: UUID(), name: "Огурцы тепличные cадово-огородные", image: "14", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: [.kilogram], message: .cardPrice, discount: nil, country: nil, isFavorite: false, isInCart: false)
 ]
    
    func addToCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isInCart = true
            cart.append(products[index])
        }
        saveCart()
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].isInCart = false
            cart.removeAll { $0.id == product.id }
        }
        saveCart()
    }
    
    private func saveCart() {
        if let encoded = try? JSONEncoder().encode(cart) {
            UserDefaults.standard.set(encoded, forKey: "cart")
        }
    }
    
    func loadCart() {
        if let savedCart = UserDefaults.standard.data(forKey: "cart"),
           let decodedCart = try? JSONDecoder().decode([Product].self, from: savedCart) {
            cart = decodedCart
            for product in cart {
                if let index = products.firstIndex(where: { $0.id == product.id }) {
                    products[index].isInCart = true
                }
            }
        }
    }
    
}
