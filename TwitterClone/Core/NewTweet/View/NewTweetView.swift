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
           TopActions()
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



struct TopActions: View {
    @Environment(\.presentationMode) var presentaionMode
    
    var body: some View {
        HStack{
            Button {
                presentaionMode.wrappedValue.dismiss()
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
