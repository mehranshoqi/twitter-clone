//
//  Feed.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetModal: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { i in
                        TweetsRowView()
                    }
                }
            }
            
            Button {
                showNewTweetModal.toggle()
            } label: {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 28, height: 28, alignment: .center)
                    .padding()
            }
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewTweetModal) {
                    NewTweetView()
                }
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
       FeedView()
    }
}
