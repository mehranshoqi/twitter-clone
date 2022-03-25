//
//  SideMenuRowView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct SideMenuRowView: View {
    var option: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: option.imageAsset)
                .foregroundColor(.gray)
            Text(option.description)
                .font(.subheadline).bold()
                .foregroundColor(.black)
        }
        .frame(height: 40)
        .padding(.horizontal)
        
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(option: SideMenuViewModel.profile)
    }
}
