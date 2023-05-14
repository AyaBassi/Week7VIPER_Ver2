//
//  NetworkableProtocol.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 14/05/2023.
//

import Foundation
protocol NetworkableProtocol {
    func getData(urlString:String)async throws -> Result<Entity,NetworkError>
}
