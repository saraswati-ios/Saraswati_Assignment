//
//  NetworkManager.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
class NetworkManager {
  static func fetchData(page: Int, completion: @escaping ([Post]) -> Void) {
      
      guard let apiUrl = Bundle.main.infoDictionary?["API_URL"] as? String else {
          print("Error: API_URL key not found in Info.plist")
          return
      }
      
    guard let url = URL(string: "\(apiUrl)?\(page)") else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      guard let data = data else { return }
      do {
        let posts = try JSONDecoder().decode([Post].self, from: data)
        completion(posts)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
}
