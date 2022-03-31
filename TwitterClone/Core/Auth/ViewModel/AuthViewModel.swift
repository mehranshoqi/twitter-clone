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
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private var userService = UserService()
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
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
                self.didRegisteredUser = true
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadUserProfilePhoto(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
            
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        self.userService.fetchUser(uid) { user in
            self.currentUser = user
        }
        
    }
}
