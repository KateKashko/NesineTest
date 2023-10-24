//
//  CartView.swift
//  NesineTest
//
//  Created by Kate Kashko on 19.10.2023.
//

import SwiftUI

struct CartView: View {
    
    @State var items: String = "" 
    @State var multiply: String = ""
    @StateObject var cartService = CartService.shared
    
    var body: some View {
       
        VStack {

            List {
                    ForEach(cartService.cartItems, id: \.self) { item in
                        Text("\(item)")
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
                    Text(multiply)
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
                        Text("Hemen oyna")
                            .foregroundColor(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
            
        }
        .onAppear {

            items = CartService.shared.items
            multiply = CartService.shared.multiply
            print(items)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
