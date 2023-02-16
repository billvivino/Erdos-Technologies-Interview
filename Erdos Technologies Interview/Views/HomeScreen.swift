//
//  HomeScreen.swift.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    @StateObject var homeScreenViewModel = HomeScreenViewModel()
    @State var showingAlert = false
    @State var alertTitle = ""
    @State var alertText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach($homeScreenViewModel.userFriendsList, id: \.id) { $userFriend in
                    FriendCell(friend: $userFriend)
                }
            }.navigationTitle("Home Screen")
                .onReceive(profileViewModel.$profile, perform: { userProfile in
                    homeScreenViewModel.fetchFriends(userProfile.emailAddress) { success in
                        if !success {
                            self.showingAlert = true
                            self.alertTitle = "Error"
                            self.alertText = "Failed to fetch friends list. Please try again later."
                        }
                    }
                })
                .toolbar {
                    ToolbarItem (placement: .confirmationAction) {
                        Button {
                            loginViewModel.logout()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .font(.title)
                        }
                    }
                }.alert(self.alertTitle, isPresented: $showingAlert) {
                    Button("OK") {
                        self.showingAlert = false
                    }
                } message: {
                    Text(self.alertText)
                }
        }
    }
}

struct HomeScreen_swift_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(ProfileViewModel())
    }
}
