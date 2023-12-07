//
//  ContentView.swift
//  ToDoList
//
//  Created by Christo on 04/12/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //signed in
            accountView
        } else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            //show a tab bar for each views inside of it
            ToDoListView(userId  : viewModel.currentUserId)
            //The user id will be what we use to listen in real time
            //for the to do list items for a particular user.
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
