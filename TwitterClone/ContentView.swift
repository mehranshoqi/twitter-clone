//
//  ContentView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct ContentView: View {
    @State private var sideMenuToggler: Bool = false
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            MainTabView().navigationBarHidden(sideMenuToggler)
            
            if sideMenuToggler {
                ZStack {
                    Color.black.opacity(sideMenuToggler ? 0.275 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeOut) {
                        sideMenuToggler = false
                    }
                }.ignoresSafeArea()
            }
            SideMenuView()
                .frame(width: 300)
                .background(Color.white)
                .offset(x: sideMenuToggler ? 0 : -300, y: 0)
        }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeOut) {
                            sideMenuToggler.toggle()
                        }
                    } label: {
                         Circle()
                            .frame(width: 20, height: 20)
                    }
                }
            }.onAppear{
                sideMenuToggler = false
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
