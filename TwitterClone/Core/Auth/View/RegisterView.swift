//
//  RegisterView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: PhotoSelectorView(),isActive: $authViewModel.didRegisteredUser,
                           label: {
                
            })
            
            TopPagesView(message1: "Get Started.", messaage2: "Create your account")
            VStack(spacing: 42) {
                CustomInput(imageAsset: "envelope", placeholder: "Email", text: $email)
                CustomInput(imageAsset: "person", placeholder: "Username", text: $username)
                CustomInput(imageAsset: "person", placeholder: "FullName", text: $fullName)
                CustomInput(imageAsset: "lock", placeholder: "Password", text: $password)
            }
            .padding(24)
            Button {
                authViewModel.register(email: email, password: password, username: username, fullName: fullName)
            } label: {
                Text("Sing Up")
            }
            .frame(width: UIScreen.main.bounds.width - 20, height: 54)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .padding(.top,28)
            
            Spacer()
            
            // sign up navigation
            Button {
                presentaionMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an accout?")
                        .font(.caption)
                        
                    Text("Sign In")
                        .font(.caption)
                        .bold()
                        
                }
            }.padding(32)
                .foregroundColor(Color(.systemBlue))
            
            
        }.ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
