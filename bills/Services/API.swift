//
//  API.swift
//  bills
//
//  Created by una ivan on 04/08/23.
//

import Foundation

class DataManager: ObservableObject {
    @Published var userData: UserData?
    
    func fetchData() {
        guard let url = URL(string: "http://127.0.0.1:3000/json/bills.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(UserData.self, from: data)
                DispatchQueue.main.async {
                    self.userData = userData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
