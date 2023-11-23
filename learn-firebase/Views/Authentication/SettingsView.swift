//
//  SettingsView.swift
//  learn-firebase
//
//  Created by magistra aptam on 20/11/23.
//

import SwiftUI

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
