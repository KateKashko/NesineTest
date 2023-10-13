//
//  CellView.swift
//  NesineTest
//
//  Created by Kate Kashko on 13.10.2023.
//

import SwiftUI

struct CellView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(viewModel.matches, id: \.id) { match in
                    ForEach(match.ocgArray, id: \.0) { key, value  in
                        ForEach(value.ocArray, id: \.0) { key, value  in
                            VStack(spacing: 0){
                                Text("\(value.n ?? "")")
                                    .foregroundColor(Color("Four"))
                                    .font(.system(.footnote))
                                Text("\(value.o ?? "")")
                                    .frame(width:56, height: 27)
                                    .background(Color("One"))
                                    .foregroundColor(Color("Four"))
                                    .font(.system(.footnote))
                                    .fontWeight(.bold)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                .padding(4)
            }
            .frame(height: 48)
            .background(Color(.white))
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
