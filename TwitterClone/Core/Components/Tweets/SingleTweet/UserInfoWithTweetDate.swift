//
//  UserInfoWithTweetDate.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct UserInfoWithTweetDate: View {
    var body: some View {
        HStack{
            Text("Mehran")
                .font(.subheadline).bold()
            Text("@mehranshoghi")
                .font(.caption)
                .foregroundColor(.gray)
            Text("2d")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct UserInfoWithTweetDate_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoWithTweetDate()
    }
}
