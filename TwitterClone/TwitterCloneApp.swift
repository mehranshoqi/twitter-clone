//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
     
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                PhotoSelectorView()
            }
            .environmentObject(authViewModel)
        }
    }
}
