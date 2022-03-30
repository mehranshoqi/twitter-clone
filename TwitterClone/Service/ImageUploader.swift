//
//  ImageUploader.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-30.
//

import Foundation
import Firebase
import UIKit

struct ImageUploader {
   static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID() .uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        ref.putData(imageData, metadata: nil) {
            _, error in
            if let error = error {
                print("Error when upload image -> \(error)")
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return }
                completion(imageUrl)
            }
        }
    }
}
