//
//  ErrorMessage.swift
//  UIKit_Portfolio
//
//  Created by Javier FO on 11/06/25.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "Invalid request"
    case unableToComplete = "unable to complete request"
    case invalidResponse = "invalid response from server"
    case invalidData = "data received invalid"
    case unableToFav = "Unabled to Fav this user"
    case alreadyInFavs = "You've already faved this user"
}
