//
//  RootView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

struct RootView: View {
    @State var showSignView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                ContentView(showSignView: $showSignView)
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthUser()
            self.showSignView = authUser == nil
            
        }
        .fullScreenCover(isPresented: $showSignView) {
            NavigationStack{
                AuthenticationView(showSignView: $showSignView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
