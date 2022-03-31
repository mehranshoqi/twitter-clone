//
//  ContentView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var sideMenuToggler: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    
    var body: some View {
        Group {
            if let userSession = authViewModel.userSession {
                authenticatedUser
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension ContentView {
    var authenticatedUser: some View {
        ZStack(alignment: .topLeading) {
            MainTabView().navigationBarHidden(sideMenuToggler)
            
            if sideMenuToggler {
                ZStack {
                    Color.black.opacity(sideMenuToggler ? 0.275 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeOut) {
                        sideMenuToggler = false
                    }
                }.ignoresSafeArea()
            }
            SideMenuView()
                .frame(width: 300)
                .background(Color.white)
                .offset(x: sideMenuToggler ? 0 : -300, y: 0)
        }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeOut) {
                            sideMenuToggler.toggle()
                        }
                    } label: {
                        KFImage(URL(string: authViewModel.currentUser?.profileImageUrl ?? ""))
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.bottom, 8)
                    }
                }
            }.onAppear{
                sideMenuToggler = false
            }
    }
}
