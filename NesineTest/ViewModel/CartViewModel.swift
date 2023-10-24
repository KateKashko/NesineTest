//
//  BasketViewModel.swift
//  NesineTest
//
//  Created by Kate Kashko on 14.10.2023.
//

import Foundation
import Combine

final class CartService: ObservableObject {
    var objectWillChange = ObservableObjectPublisher()

    static let shared = CartService()
    private init() {}
    
    var cartItems: [String] = []
    
    var items: String {
        print(cartItems.joined())
        return cartItems.joined(separator: "\n")
    }
    
    var multiply: String {
        var result: Double = 1
        
        for item in cartItems {
            result *= Double.init(item) ?? 0
        }
        objectWillChange.send()
        return String(format: "%.2f", result)
    }
    
}


