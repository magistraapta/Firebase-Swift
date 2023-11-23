//
//  SettingsView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

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

struct SettingsView: View {
    @StateObject private var settingVM = SettingsViewModel()
    @Binding var showSignView: Bool
    var body: some View {
        List{
            Button {
                Task{
                    do{
                        try settingVM.logOut()
                        showSignView = true
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Log Out")
            }
            
            Button {
                Task{
                    do{
                        try await settingVM.updateEmail()
                        print("email updated")
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Update Email")
            }
            
            Button {
                Task{
                    do{
                        try await settingVM.resetPassword()
                        print("email reseted")
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Reset Password")
            }
            
            Button {
                Task{
                    do{
                        try await settingVM.userEmailVerification()
                        print("verification send")
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Send Verification")
            }
            
            Button {
                Task{
                    do{
                        try await settingVM.updatePassword()
                        print("password updated")
                    }catch{
                        print(error)
                    }
                }
            } label: {
                Text("Update password")
            }



        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignView: .constant(false))
        }
    }
}
