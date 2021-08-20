//
//  User.swift
//  GitHubApp
//
//  Created by Rafael Levy on 8/20/21.
//

import Foundation

struct User : Codable {
    let login: String
    let avatarUrl: String
    var name: String?
}
