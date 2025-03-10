//
//  FriendDetailView.swift
//  UsersList
//
//  Created by David Ferreira on 09/03/25.
//

import SwiftUI

struct FriendDetailView: View {
    let friend: Friend
        
    var body: some View {
        VStack {
            Text(friend.name)
                .font(.title)
            Text("ID: \(friend.id.uuidString)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle("Detalhes do Amigo")
    }
}

#Preview {
    FriendDetailView(friend: Friend(id: UUID(), name: "BObby bokks"))
}
