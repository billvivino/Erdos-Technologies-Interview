//
//  ContentView.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    var body: some View {
        LoginScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProfileViewModel())
    }
}
