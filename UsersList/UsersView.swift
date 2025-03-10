//
//  UsersView.swift
//  UsersList
//
//  Created by David Ferreira on 07/03/25.
//

import SwiftData
import SwiftUI

struct Response: Codable {
    var users: [User]
}

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
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
        let usersData = await fetchUsers()
        
        for user in usersData {
            modelContext.insert(user)
        }
        
        isLoading = false
    }
}

//#Preview {
//    UsersView()
//}
