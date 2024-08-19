//
//  Product.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import Foundation

class Product: Identifiable, Hashable, Codable {
    let id: UUID
    
    let name: String
    let image: String
    let cost: Double
    var quantity: Double
    var rating: Double?
    let originalPrice: Double?
    let unitType: [UnitType]
    let message: ProductMessage?
    let discount: Double?
    let country: String?
    
    var isFavorite: Bool
    var isInCart: Bool
    
    init(id: UUID = UUID(), name: String, image: String, cost: Double, quantity: Double, rating: Double? = nil, originalPrice: Double? = nil, unitType: [UnitType], message: ProductMessage? = nil, discount: Double? = nil, country: String? = nil, isFavorite: Bool = false, isInCart: Bool = false) {
        self.id = id
        self.name = name
        self.image = image
        self.cost = cost
        self.quantity = quantity
        self.rating = rating
        self.originalPrice = originalPrice
        self.unitType = unitType
        self.message = message
        self.discount = discount
        self.country = country
        self.isFavorite = isFavorite
        self.isInCart = isInCart
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

