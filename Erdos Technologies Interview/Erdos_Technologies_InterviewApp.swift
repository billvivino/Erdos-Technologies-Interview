//
//  Erdos_Technologies_InterviewApp.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

@main
struct Erdos_Technologies_InterviewApp: App {
    @StateObject var profileViewModel = ProfileViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileViewModel)
        }
    }
}
