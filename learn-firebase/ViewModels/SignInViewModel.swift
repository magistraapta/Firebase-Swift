//
//  SignInViewModel.swift
//  learn-firebase
//
//  Created by magistra aptam on 23/11/23.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Email and password not found!")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
}
