//
//  HomeScreen.swift.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var homeScreenViewModel = HomeScreenViewModel()
    var body: some View {
        ScrollView {
            ForEach($homeScreenViewModel.userFriendsList, id: \.id) { $userFriend in
                FriendCell(friend: $userFriend)
            }
        }.navigationTitle("Home Screen")
            .onAppear {
                homeScreenViewModel.fetchFriends()
            }
    }
}

struct HomeScreen_swift_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
