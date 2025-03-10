//
//  UsersListApp.swift
//  UsersList
//
//  Created by David Ferreira on 07/03/25.
//

import SwiftData
import SwiftUI

@main
struct UsersListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
