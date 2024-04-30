//
//  PostListViewModel.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
import SwiftUI

class PostListViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var isLoading = false
  @Published var currentPage = 1
  @Published var hasMoreData = true

    func fetchData() {
        isLoading = true
        NetworkManager.fetchData(page: currentPage) { [weak self] posts in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                self.posts.append(contentsOf: posts)
                self.currentPage += 1
                self.hasMoreData = posts.count == 10 // Adjust page size as needed
            }
        }
    }
    func loadMoreData() {
        guard hasMoreData else { return }
        fetchData()
      }
}
