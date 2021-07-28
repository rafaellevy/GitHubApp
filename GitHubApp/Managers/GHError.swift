//
//  GHError.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/19/21.
//

import Foundation

enum GHError: String, Error {
    case invalidUsername = "invalid username"
    case invalidReq = "invalid request"
    case invalidRes = "invalid Response"
    case invalidData = "invalid Data"
}
