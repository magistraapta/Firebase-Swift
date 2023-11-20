//
//  ContentView.swift
//  learn-firebase
//
//  Created by magistra aptam on 19/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AuthenticationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
