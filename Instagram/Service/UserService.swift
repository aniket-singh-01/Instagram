//
//  UserService.swift
//  Instagram
//
//  Created by Aniket Singh on 16/05/24.
//

import Foundation
import Firebase

struct UserService{
    static func fetchUsers(withUid uid: String) async throws -> User{
        let snapshot=try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws ->[User]{
        let snapshot=try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self) })
    }
}
