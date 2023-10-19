//
//  CartView.swift
//  NesineTest
//
//  Created by Kate Kashko on 19.10.2023.
//

import SwiftUI

struct CartView: View {
    let totalPrice = CartViewModel().totalPrice
    
    var body: some View {
        VStack {
            Text("Sepet")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List {
                ForEach(0..<cartItems.endIndex, id:\.self) {item in


                        VStack(spacing: 5) {
                            Text(cartItems[item])
//                            Text(cartItems[item] as! String)
//                            Text("$\(String(format: "%.2f", cartItems[item] as! Double))")
                                .foregroundColor(.gray)
                    }
                }.onDelete{indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    CartViewModel().calculateTotalPrice()
                }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("Three"))
                    .opacity(0.8)
                    .frame(width: 350, height: 120)
                VStack {
                    Text("Toplam")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    Text("TL\(String(format: "%.2f", totalPrice))")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                }
                Button() {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                            .foregroundColor(.white)
                        Text("Şimdi öde >")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
            
        }.onAppear(perform: CartViewModel().calculateTotalPrice)
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
