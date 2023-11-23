//
//  ContentView.swift
//  learn-firebase
//
//  Created by magistra aptam on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var showSignView: Bool
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SettingsView(showSignView: $showSignView)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(showSignView: .constant(false))
        }
    }
}
