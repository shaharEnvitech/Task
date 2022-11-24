//
//  CustomError.swift
//  Genesys
//
//  Created by intellithings on 23/11/2022.
//

import Foundation

enum CustomError: String, Error {
    case invalidURL = "URL is invalid"
    case noConnection = "No Internet Connection"
    case dataError = "Data error"
}
