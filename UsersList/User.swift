//
//  User.swift
//  UsersList
//
//  Created by David Ferreira on 07/03/25.
//

import Foundation


struct User: Codable, Identifiable {    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company, email, address, about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}


struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

func fetchUsers() async -> [User] {
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
        print("Invalid URL")
        return []
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let users = try decoder.decode([User].self, from: data)
        
        return users
        
    } catch {
        print(error.localizedDescription)
        print(String(describing: error))
    }
    
    return []
}
