//
//  TweetsRowView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View{
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                VStack(alignment: .leading, spacing: 4) {
                    // user information
                    UserInfoWithTweetDate()
                    // tweet content
                    Text("This is first tweet from mehran")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }.padding([.leading])
            TweetActions()
            Divider()
        }.padding([.top])
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
