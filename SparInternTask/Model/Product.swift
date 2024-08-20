//
//  Product.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import Foundation

struct Product: Identifiable, Hashable, Codable {
    let id: String
    
    let name: String
    let image: String
    let cost: Double
    var quantity: Double
    var rating: Double?
    let originalPrice: Double?
    var unitType: UnitType
    let message: ProductMessage?
    let discount: Double?
    let country: String?
    
    var isFavorite: Bool
    
    var isInCart: Bool {
        if quantity > 0 {
            return true
        } else {
            return false
        }
    }
    var specifier: String {
        switch unitType {
        case .kilogram:
            "%.2f"
        case .piece:
            "%.0f"
        }
    }
    
    
}

