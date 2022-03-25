//
//  SingleUserView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct SingleUserView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text("Mehran shoghi")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                Text("some other name ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }.padding(12)
    }
}

struct SingleUserView_Previews: PreviewProvider {
    static var previews: some View {
        SingleUserView()
    }
}
