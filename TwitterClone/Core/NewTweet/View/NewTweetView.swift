//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption: String = ""
    var body: some View {
        VStack {
           topActions
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 56, height: 56)
                
                TextArea("What's new ?", text: $caption )
            }.padding(12)
        }
    }
}

struct NewTweetView_Preview: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}



extension NewTweetView {
    var topActions: some View {
        HStack{
            Button {
                //
            } label: {
                 Text("Cancel")
                    .font(.subheadline)
                    .foregroundColor(Color(.systemBlue))
            }
            Spacer()
            Button {
                //
            } label: {
                 Text("Tweet")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .clipShape(Capsule())
        }.padding()
        
       
    }
}
