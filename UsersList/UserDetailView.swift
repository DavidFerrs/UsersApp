//
//  UserDetailView.swift
//  UsersList
//
//  Created by David Ferreira on 08/03/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    // Informações principais do usuário
                    Text(user.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(user.isActive ? "Ativo" : "Inativo")
                            .font(.subheadline)
                            .foregroundColor(user.isActive ? .green : .red)
                        Spacer()
                        Text("Idade: \(user.age)")
                            .font(.subheadline)
                    }
                    
                    // Informações adicionais
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Email: \(user.email)")
                        Text("Empresa: \(user.company)")
                        Text("Endereço: \(user.address)")
                        Text("Registrado em: \(dateFormatter.string(from: user.registered))")
                        Text("Sobre: \(user.about)")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    // Tags
                    if !user.tags.isEmpty {
                        Text("Tags")
                            .font(.headline)
                            .padding(.top, 10)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(user.tags, id: \.self) { tag in
                                    Text(tag)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                    
                    // Lista de Amigos
                    Text("Amigos (\(user.friends.count))")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    if user.friends.isEmpty {
                        Text("Nenhum amigo encontrado.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(user.friends) { friend in
                            NavigationLink {
                                FriendDetailView(friend: friend)
                            } label: {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .foregroundColor(.blue)
                                    Text(friend.name)
                                        .font(.body)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationTitle("Detalhes do Usuário")
        }
    }

//#Preview {
//    do {
//        let user = User(id: UUID(), isActive: true, name: "Taylor", age: 19, company: "TalkShow", email: "t@ylor.com", address: "asda", about: "mmasdi asdjjsda pjsadpaoda sdaodkas jiean,anisn asmdaspodmmuinemiinsnfmouias aoisai", registered: Date.now, tags: ["Music", "Singer"], friends: [Friend(id: UUID(), name: "Bob Blank")])
//        
//        return UserDetailView(user: user)
//    } catch {
//        return Text("Not possible to load users")
//    }
//}
