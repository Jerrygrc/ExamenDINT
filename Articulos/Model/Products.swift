//
//  Products.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 10/3/25.
//

import Foundation

struct Rating: Codable {
    let rate: Double
    let count: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}
