//
//  Student.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

struct Student {
    var name: String
    var profilePicture: String
    var address: String
}

extension Student {
    static func getStudent() -> [Student] {
        return [
            .init(name: "Jeane", profilePicture: "person-profile-1", address: "Fan Street 331"),
            .init(name: "Keane", profilePicture: "person-profile-2", address: "Bandung Street 331"),
            .init(name: "Robert", profilePicture: "person-profile-3", address: "Jakarta Street 331"),
            .init(name: "Bob", profilePicture: "person-profile-2", address: "Iphone Street 331"),
            .init(name: "Jessica", profilePicture: "person-profile-1", address: "Night Street 331"),
            .init(name: "Natalia", profilePicture: "person-profile-1", address: "Natlan Street 331"),
            .init(name: "John", profilePicture: "person-profile-3", address: "Inazuma Street 331"),
            .init(name: "Layla", profilePicture: "person-profile-1", address: "Narukami Street 331"),
            .init(name: "Kevin", profilePicture: "person-profile-2", address: "Fontaine Street 331"),
            .init(name: "Jean", profilePicture: "person-profile-1", address: "Phantom Street 331"),
        ]
    }
}
