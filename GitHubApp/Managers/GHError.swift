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
    case unableToSave = "Unable to save this user"
    case unableToRetrieveFavorites = "Unable to retrieve favorites. Please try again"
    case favoriteAlreadyExists = "This user has already been favorited"
}
