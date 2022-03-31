//
//  ExploreView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 20 , id: \.self) {user in
                            NavigationLink {
//                                ProfileView()
                            } label: {
                                SingleUserView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exploreer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
