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
