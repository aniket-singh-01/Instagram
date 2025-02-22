//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Aniket Singh on 19/06/24.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init(){
        Task{
            try await fetchPosts()
        }
    }
    @MainActor
    func fetchPosts() async throws{
        self.posts = try await PostService.fetchFeedPost()
    }
}
