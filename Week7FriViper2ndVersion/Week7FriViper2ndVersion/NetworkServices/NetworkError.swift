//
//  NetworkError.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 14/05/2023.
//

import Foundation
enum NetworkError : Error {
    case invalidUrl
    case parsingError
    case urlResponse
    case unknown(Error)
}
extension NetworkError:LocalizedError {
    var errorDescription: String?{
        switch self{
        case .invalidUrl:
            return NSLocalizedString("invalidUrl", comment: "comment: invalidUrl")
        case .parsingError:
            return NSLocalizedString("parsingError", comment: "comment: parsingError")
        case .urlResponse:
            return NSLocalizedString("urlResponse", comment: "comment: urlResponse")
        case .unknown(let error):
            return NSLocalizedString("unkownError: \(error.localizedDescription)", comment: "Unknow error")
        }
    }
}


