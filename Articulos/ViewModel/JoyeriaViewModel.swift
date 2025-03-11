//
//  JoyeriaViewModel.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 11/3/25.
//

import Foundation

class JoyeriaViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        fetchJoyeria()
    }
    
    func fetchJoyeria() {
        let urlString = "https://fakestoreapi.com/products/category/electronics"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No se han recibido datos")
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.products = products
                }
            } catch {
                print("Error decodificando JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
