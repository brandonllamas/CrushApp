//
//  CrushAppApp.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI
import Firebase

@main
struct CrushAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
