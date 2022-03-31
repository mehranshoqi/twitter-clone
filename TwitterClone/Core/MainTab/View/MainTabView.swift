//
//  MainTabView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selevtedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selevtedTabIndex) {
            FeedView().onTapGesture {
                selevtedTabIndex = 0
            }.tabItem {
                Image(systemName: "house")
            }.tag(0)
            
            ExploreView().onTapGesture {
                selevtedTabIndex = 1
            }.tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            
            NotificationView().onTapGesture {
                selevtedTabIndex = 2
            }.tabItem {
                Image(systemName: "bell")
            }.tag(2)
            
//            ProfileView().onTapGesture {
//                selevtedTabIndex = 3
//            }.tabItem {
//                Image(systemName: "envelope")
//            }.tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
