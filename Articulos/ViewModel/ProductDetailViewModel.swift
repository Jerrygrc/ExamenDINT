//
//  ProductDetailViewModel.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 10/3/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    
    func fetchProductDetail(id: Int) {
        let urlString = "https://fakestoreapi.com/products/\(id)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No se han recibido datos para el detalle")
                return
            }
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async {
                    self.product = product
                }
            } catch {
                print("Error decodificando detalle: \(error.localizedDescription)")
            }
        }.resume()
    }
}
