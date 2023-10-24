//
//  SectionView.swift
//  NesineTest
//
//  Created by Kate Kashko on 13.10.2023.
//

import SwiftUI

struct SectionView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var cartService = CartService.shared
    

    @State var goToCart = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.matches, id: \.id) { match in
                        
                        VStack(spacing: 0) {
                            ZStack{
                                Color("Two")
                                VStack {
                                    ZStack{
                                        Color("Three")
                                            .frame(maxWidth: .infinity, maxHeight: 40)
                                        HStack{
                                            Text("\(match.ln ?? "")")
                                            Spacer()
                                            Text("\(match.date ?? "")")
                                            Text("\(match.day ?? "")")
                                        }
                                        .foregroundColor(.white)
                                        .font(.system(size: 16))
                                        .padding(6)
                                    }
                                    
                                    Text("\(match.matchName ?? "")")
                                        .foregroundColor(Color("Four"))
                                        .bold()
                                    
                                    ScrollView(.horizontal){
                                        HStack {
                                            ForEach(match.ocgArray, id: \.0) { key, value in
                                                ForEach(value.ocArray, id: \.0) { key, value in
                                                    VStack(spacing: 0){
                                                        Text("\(value.n ?? "no N")")
                                                            .foregroundColor(Color("Four"))
                                                            .font(.system(.footnote))
                                                        Button(action: {
                                                            let data = value.o
                                                            
                                                            cartService.cartItems.append(data ?? "")
                                                            
                                                            print(cartService.cartItems)
                                                        }) {
                                                            Text("\(value.o ?? "no O")")
                                                                .frame(width:56, height: 27)
                                                                .background(Color("Four"))
                                                                .foregroundColor(.white)
                                                                .font(.system(.footnote))
                                                                .fontWeight(.bold)
                                                                .cornerRadius(5)
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        .frame(height: 48)
                                        .background(Color(.white))
                                    }
                                }
                                .onAppear {
                                    print("\(match.id)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bülten")
            .navigationDestination(isPresented: $goToCart) {
                CartView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        goToCart = true
                    }label: {
                        Image(systemName: "cart")
                    }
                }
            }
        }
        .task {
            await viewModel.getMatchData()
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
