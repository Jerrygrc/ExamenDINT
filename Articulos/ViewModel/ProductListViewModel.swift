//
//  ProductListViewModel.swift
//  Articulos
//
//  Created by Gerardo Ramallo Couce on 10/3/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        fetchElectronics()
    }
    
    func fetchElectronics() {
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
    func fetchJoyeria() {
        let urlString = "https://fakestoreapi.com/products/category/jewelery"
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
    func fetchHombre() {
        let urlString = "https://fakestoreapi.com/products/category/men's clothing"
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
    func fetchMujer() {
        let urlString = "https://fakestoreapi.com/products/category/women's clothing"
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
