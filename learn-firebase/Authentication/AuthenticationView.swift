//
//  AuthenticationView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignView: Bool
    var body: some View {
        VStack{
            NavigationLink {
                SignInWithEmailView(showSignview: $showSignView)
            } label: {
                Text("Sign in with Email")
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Sign up")
        .padding()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignView: .constant(false))
        }
    }
}
