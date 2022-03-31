//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI
import Kingfisher


struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View{
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                KFImage(URL(string: authViewModel.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .frame(width: 48, height: 48)
                    .padding(.bottom, 8)
                Text(authViewModel.currentUser?.fullName ?? "Nil")
                    .font(.headline)
                Text("@\(authViewModel.currentUser?.username ?? "Nil")")
                    .foregroundColor(.gray)
                    .font(.caption)
                UserStatsView()
            }.padding()
            
            sideMenuOptions
            
            Spacer()
            
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}


//extension SideMenuView {
//    var userInfo: some View {
//
//    }
//}


extension SideMenuView {
    var sideMenuOptions: some View {
        ForEach(SideMenuViewModel.allCases,id: \.self) {option in
            if option == .logout {
                Button {
                    authViewModel.signOut()
                } label: {
                    SideMenuRowView(option: option)
                }
            }
            else {
                NavigationLink {
                    if option == .profile {
                        if let user = authViewModel.currentUser {
                            ProfileView(user: user)
                        }
                    }
                } label: {
                    SideMenuRowView(option: option)
                }
            }
        }
    }
}
