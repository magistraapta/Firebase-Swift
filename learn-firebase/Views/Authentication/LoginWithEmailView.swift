//
//  LoginWithEmailView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

struct LoginWithEmailView: View {
    @Binding var showSignView: Bool
    @StateObject private var loginVM = loginEmailViewModel()
    var body: some View {
        VStack {
            TextField("Email", text: $loginVM.email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $loginVM.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            
            Button {
                Task{
                    do{
                        try await loginVM.logIn()
                        showSignView = false
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Sign in")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle("Login")
        .padding()
    }
}

struct LoginWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginWithEmailView(showSignView: .constant(false))
        }
    }
}
