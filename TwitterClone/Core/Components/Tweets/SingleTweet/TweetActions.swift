//
//  TweetActions.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct TweetActions: View {
    var body: some View {
        HStack{
            Button {
                //
            } label: {
                Image(systemName: "bubble.left")
                    .font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "heart")
                    .font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "bookmark")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }.padding()
    }
}

struct TweetActions_Previews: PreviewProvider {
    static var previews: some View {
        TweetActions()
    }
}
