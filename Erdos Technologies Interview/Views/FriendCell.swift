//
//  FriendCell.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct FriendCell: View {
    @Binding var friend: UserProfile
    var body: some View {
        HStack (alignment: .top) {
            if let url = URL(string: friend.profilePicDownloadUrl) {
                AsyncImage(url: url)
                    .frame(width: 100,
                           height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                    .padding(.trailing)
            }
            VStack (alignment: .leading) {
                Text("\(friend.firstName) \(friend.lastName)")
                    .bold()
                Text(friend.emailAddress)
            }.font(.body)
            Spacer()
        }.padding()
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(friend: .constant(.empty))
    }
}
