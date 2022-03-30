//
//  TopPagesView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI

struct TopPagesView: View {
    let message1: String
    let messaage2: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(message1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(messaage2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 250)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight],radius: 70))
    }
}

