//
//  Enums.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import Foundation

enum ProductMessage: String, CaseIterable, Codable {
    
    case newProduct = "Новинки"
    case bigSale = "Удар по ценам"
    case cardPrice = "Цена по карте"
    
    var color: String {
        switch self {
        case .newProduct:
            return "messagePurple"
        case .bigSale:
            return "messageRed"
        case .cardPrice:
            return "messageGreen"
        }
    }
}

enum UnitType: String, CaseIterable, Codable  {
    case piece = "Шт"
    case kilogram = "Кг"
}
