//
//  UserModel.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-30.
//

import FirebaseFirestoreSwift


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let email: String
    let profileImageUrl: String
}
