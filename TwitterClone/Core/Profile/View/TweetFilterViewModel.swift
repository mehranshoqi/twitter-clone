//
//  TweetFilterViewModel.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweet
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweet:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}
