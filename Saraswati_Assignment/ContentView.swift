//
//  ContentView.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostListViewModel()
    @State private var selectedPost: Post? = nil
    
    var postsGroupedByUserId: [Int: [Post]] {
        return Dictionary(grouping: viewModel.posts, by: { $0.userId })
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(postsGroupedByUserId.sorted { $0.key < $1.key },  id:\.key) { key, value in  // Sort by key
                    Section(header: Text("User \(key)")) {
                        ForEach(value) { post in
                            PostCardView(post: post)
                            
                                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 18, trailing: 0))
                                .background(Color.clear)
                                .onTapGesture {
                                    selectedPost = post
                                }
                        }
                    }
                }
                if viewModel.hasMoreData {
                          ProgressView()
                            .onAppear { // Load more data when reaching the end
                              viewModel.loadMoreData()
                            }
                        }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchData()
            }
            .sheet(item: $selectedPost) { post in // Show modal when selectedPost is set
                ModalView(post: post, selectedPostBinding:  $selectedPost)
            }
        }
    }
}

#Preview {
    ContentView()
}
