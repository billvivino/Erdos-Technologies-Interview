//
//  FriendCell.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct FriendCell: View {
    @Binding var friend: UserProfile
    @State var detailClicked = false
    
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
            .navigationDestination(isPresented: $detailClicked) {
                FriendDetailView(friend: $friend)
            }
            .onTapGesture {
                self.detailClicked = true
            }
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(friend: .constant(.dummy))
    }
}
