//
//  learn_firebaseApp.swift
//  learn-firebase
//
//  Created by magistra aptam on 19/11/23.
//

import SwiftUI
import Firebase
import FirebaseCore
@main
struct learn_firebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
