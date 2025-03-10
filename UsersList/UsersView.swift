//
//  UsersView.swift
//  UsersList
//
//  Created by David Ferreira on 07/03/25.
//

import SwiftUI

struct Response: Codable {
    var users: [User]
}

struct UsersView: View {
    @State private var users = [User]()
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(user.isActive ? .green : .red)
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text(user.email)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Users List")
            .overlay {
                if isLoading {
                    ProgressView("Carregando...")
                }
            }
            .task {
                if users.isEmpty {
                    await loadUsers()
                }
            }
        }
    }
    
    func loadUsers() async {
        isLoading = true
        users = await fetchUsers()
        isLoading = false
    }
}

#Preview {
    UsersView()
}
