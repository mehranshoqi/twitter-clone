//
//  CustomInput.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-25.
//

import SwiftUI

struct CustomInput: View {
    let imageAsset: String
    let placeholder: String
    var isSecure: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageAsset)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(.darkGray))
                if isSecure ?? false  {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            Divider()
                .background(.red)
        }
    }
}

struct CustomInput_Previews: PreviewProvider {
    static var previews: some View {
        CustomInput(imageAsset: "bell", placeholder: "Email",isSecure: false, text: .constant(""))
    }
}
