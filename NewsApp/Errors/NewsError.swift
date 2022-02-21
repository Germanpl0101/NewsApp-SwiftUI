//
//  NewsError.swift
//  NewsApp
//
//  Created by German Blonski on 21.02.2022.
//

import Foundation

enum NewsError {
    case invalidServerError
}

extension NewsError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidServerError:
            return NSLocalizedString("Invalid server error", comment: "")
        }
    }
}
