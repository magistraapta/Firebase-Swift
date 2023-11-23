//
//  SettingsViewModel.swift
//  learn-firebase
//
//  Created by magistra aptam on 23/11/23.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    func logOut() throws{
        try AuthenticationManager.shared.userSignOut()
    }
    
    func updateEmail() async throws {
        let email = "mynew@email.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "newPassword123"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
    func resetPassword()async throws{
        let authUser = try AuthenticationManager.shared.getAuthUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    func userEmailVerification() async throws {
        try await AuthenticationManager.shared.verificationEmail()
    }
}
