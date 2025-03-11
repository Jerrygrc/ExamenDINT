//
//  ProductDetailView.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 10/3/25.
//

import SwiftUI

struct ProductDetailView: View {
    let productID: Int
    @StateObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        VStack {
            if let product = viewModel.product {
                ScrollView {
                    VStack(spacing: 20) {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width: 150, height: 150)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(product.title)
                            .font(.title)
                            .padding(.horizontal)
                        Text(product.description)
                            .font(.caption)
                            .padding()
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title2)
                            .foregroundColor(.secondary)

                    }
                }
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchProductDetail(id: productID)
                    }
            }
        }
       // .navigationTitle("Detalle del producto")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productID: 7)
    }
}

