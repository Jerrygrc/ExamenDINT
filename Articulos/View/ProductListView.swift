//
//  ProductListView.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 10/3/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(productID: product.id)) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: 50, height: 50)
                                 .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                        }
                    }
                }
            }
        }.toolbar{
            ToolbarItem(placement: .bottomBar){
                Button(action: {
                    viewModel.fetchElectronics()
                }){
                    Image(systemName: "laptopcomputer")
                }
            }

            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    viewModel.fetchJoyeria()
                }){
                    Image(systemName: "giftcard")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    viewModel.fetchHombre()
                }){
                    Image(systemName: "figure.stand")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    viewModel.fetchMujer()
                }){
                    Image(systemName: "figure.stand.dress")
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
