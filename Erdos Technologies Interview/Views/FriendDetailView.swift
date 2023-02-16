//
//  FriendDetailView.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct FriendDetailView: View {
    @Binding var friend: UserProfile
    var body: some View {
        Text("Friend Detail View")
            .navigationTitle(friend.name)
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(.dummy))
    }
}
