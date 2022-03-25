//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            userInfo
            
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


extension SideMenuView {
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Circle()
                .frame(width: 48, height: 48)
                .padding(.bottom, 8)
            Text("Mehran Shoghi")
                .font(.headline)
            Text("@mehranshoghi")
                .foregroundColor(.gray)
                .font(.caption)
            UserStatsView()
        }.padding()
    }
}


extension SideMenuView {
    var sideMenuOptions: some View {
        ForEach(SideMenuViewModel.allCases,id: \.self) {option in
            NavigationLink {
                if option == .profile {
                    ProfileView()
                }
            } label: {
                SideMenuRowView(option: option)
            }
        }
    }
}
