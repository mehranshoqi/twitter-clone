//
//  LoginView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            // top message
            TopPagesView(message1: "Hello!", messaage2: "Welcome Back.")
            
            // login inputs
            VStack(spacing: 40) {
                CustomInput(imageAsset: "envelope", placeholder: "Email", text: $email)
                CustomInput(imageAsset: "lock", placeholder: "Passwrod",isSecure: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 42)
            
            // forgot password
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Forgot password view - Todo")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .foregroundColor(Color(.systemBlue))
                        .fontWeight(.semibold)
                        .padding(.trailing)
                        .padding(.top)
                }
            }.padding(.bottom)
            
            // Sign in button
            Button {
                authViewModel.login(email: email, password: password)
            } label: {
                Text("Sing In")
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 54)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            
            Spacer()
            
            // sign up navigation
            NavigationLink {
                RegisterView()
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.caption)
                        
                    Text("Sign up")
                        .font(.caption)
                        .bold()
                        
                }
            }.padding(32)
                .foregroundColor(Color(.systemBlue))
            
        }.ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
