//
//  PhotoSelectorView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-30.
//

import SwiftUI

struct PhotoSelectorView: View {
    @State private var showSheet = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            TopPagesView(message1: "Hey,", messaage2: "Add profile photo")
            
            Button {
                showSheet.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
                .sheet(isPresented: $showSheet, onDismiss: setImage) {
                    ImagePicker(selectedImage:$selectedImage)
                }
            
            Spacer()
            
            if profileImage != nil {
                Button {
                    //
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 320, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
            Spacer()
            
        }.ignoresSafeArea()
    }
    
    func setImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 70, height: 70)
            .padding()
            .border(Color.blue)
            .clipShape(Circle())
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
