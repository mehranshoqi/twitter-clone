//
//  ProfileView.swift
//  TwitterClone
//
//  Created by mehran on 2022-03-24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweet
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack{
            headerView
            
            actionButtons
            
            bio
            
            UserStatsView().padding([.leading],10)
            
            tweetFilters
            
            tweets
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 16)
                        .offset(x: 12, y: 10)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
            
        }.frame(height: 96)
    }
}

extension ProfileView {
    var actionButtons: some View {
        HStack {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(5)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.8))
            
            Button {
                //
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.8))
            }
        }.padding(.trailing)
    }
}


extension ProfileView {
    var bio: some View {
        VStack(alignment: .leading,spacing: 4) {
            // name
            HStack {
                Text("Mehran Shoghi")
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                    .font(.subheadline)
                
                Spacer()
            }
            // username
            Text("@mehranshoghi")
                .foregroundColor(.gray)
                .font(.subheadline)
            
            // bio
            Text("This my biography Lol!")
                .font(.subheadline).padding([.top,.bottom], 8)
            
            // location & link
            HStack(spacing: 24) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("Tehran, Iran")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                HStack{
                    Image(systemName: "link")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("https://mehrun.pro/")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }.padding(.vertical,4)
            
        }.padding([.leading],10)
    }
}



extension ProfileView {
    var tweetFilters: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) {
                item in VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 4 )
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 4 )
                    }
                }.onTapGesture {
                    withAnimation {
                        self.selectedFilter = item
                    }
                }
            }
        }
        
    }
}


extension ProfileView {
    var tweets: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 8, id: \.self) {tweet in
                    TweetsRowView()
                }
            }
        }
    }
}
