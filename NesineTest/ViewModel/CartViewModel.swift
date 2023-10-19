//
//  BasketViewModel.swift
//  NesineTest
//
//  Created by Kate Kashko on 14.10.2023.
//

import Foundation
import SwiftUI


var cartItems: [String] = [

]

class CartViewModel: ObservableObject {
    @Published var totalPrice = 0.00
    @Published var showingCart = false
    
    func calculateTotalPrice() {
        totalPrice = 0.00
        for _ in 0..<cartItems.count {
            totalPrice *= cartItems as! Double
        }
    }
}
