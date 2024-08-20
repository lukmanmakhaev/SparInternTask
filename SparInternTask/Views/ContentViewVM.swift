//
//  ContentViewVM.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import Foundation

final class ContentViewVM: ObservableObject {
    
    @Published var products = [
    Product(id: "1", name: "сыр Ламбер 500/0 230г", image: "1", cost: 99.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .bigSale, discount: nil, country: nil, isFavorite: false),
    Product(id: "2", name: "Энергетический Напит", image: "2", cost: 95699.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: nil, isFavorite: true),
    Product(id: "3", name: "Салат Овощной с Крабовыми Палочками", image: "3", cost: 250.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: nil, isFavorite: false),
    Product(id: "4", name: "Дорадо Охлажденная Непотрошеная 300-400г", image: "4", cost: 59.20, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: 0.25, country: nil, isFavorite: false),
    Product(id: "5", name: "Ролл Маленькая Япония 216г", image: "5", cost: 367.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .newProduct, discount: nil, country: nil, isFavorite: false),
    Product(id: "6", name: "Огурцы тепличные cадово-огородные", image: "6", cost: 59.20, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .cardPrice, discount: nil, country: "Франция🇫🇷", isFavorite: false),
    Product(id: "7", name: "Манго Кео", image: "7", cost: 1298, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .newProduct, discount: 0.25, country: nil, isFavorite: false),
    Product(id: "8", name: "Салат Овощной с Крабовыми Палочками", image: "8", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: nil, isFavorite: true),
    Product(id: "9", name: "Салат Овощной с Крабовыми Палочками", image: "9", cost: 1928.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: nil, isFavorite: false),
    Product(id: "10", name: "Масло Слобода Рафинированное 1,8л", image: "10", cost: 1298.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .bigSale, discount: nil, country: nil, isFavorite: false),
    Product(id: "11", name: "Салат Овощной с Крабовыми Палочками", image: "11", cost: 250.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: "Франция🇫🇷", isFavorite: false),
    Product(id: "12", name: "Макаронные Изделия SPAR Спагетти 450г", image: "12", cost: 2600.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .newProduct, discount: nil, country: nil, isFavorite: false),
    Product(id: "13", name: "Огурцы тепличные cадово-огородные", image: "13", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: nil, discount: nil, country: "Франция🇫🇷", isFavorite: false),
    Product(id: "14", name: "Огурцы тепличные cадово-огородные", image: "14", cost: 120.90, quantity: 0, rating: 4.1, originalPrice: 199, unitType: .kilogram, message: .cardPrice, discount: nil, country: nil, isFavorite: false)
 ]
    
    init() {
        loadCart()
    }
    
    func saveCart() {
        if let encoded = try? JSONEncoder().encode(products) {
            UserDefaults.standard.set(encoded, forKey: "cart")
        }
    }
    
    private func loadCart() {
        if let savedProducts = UserDefaults.standard.data(forKey: "cart"),
           let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedProducts) {
            self.products = decodedProducts
        }
    }
    
    func cleanCart() {
        products = products.map { product in
            var updatedProduct = product
            updatedProduct.quantity = 0
            return updatedProduct
        }
        saveCart()
    }
}
