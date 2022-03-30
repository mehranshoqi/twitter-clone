//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI
import Firebase

 
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didRegisteredUser: Bool = false
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String ){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error Login User -> \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(email: String, password: String, username: String, fullName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error Create New User -> \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let userData = ["email": email, "username": username, "fullName": fullName, "uid": user.uid]
                
            Firestore.firestore().collection("users").document(user.uid).setData(userData) { _ in
                print("save new user information! :D")
                self.didRegisteredUser = true
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadUserProfilePhoto(_ image: UIImage) {
        guard let uid = userSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
            
        }
    }
}
