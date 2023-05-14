//
//  NetworkManager.swift
//  Week7FriViper2ndVersion
//
//  Created by Payam Karbassi on 14/05/2023.
//

import UIKit


class NetworkManager:NetworkableProtocol{
    func getData(urlString: String) async throws -> Result<Entity, NetworkError> {
        do {
            guard let url = URL(string: urlString) else {throw NetworkError.invalidUrl}
            
            let (data, response ) = try await URLSession.shared.data(from: url)
            
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {throw NetworkError.urlResponse }
            
            guard let resutlt = try? JSONDecoder().decode(Entity.self, from: data) else {throw NetworkError.parsingError}
            
            return .success(resutlt)
        }catch NetworkError.invalidUrl  {return .failure(.invalidUrl)
        }catch NetworkError.urlResponse {return .failure(.urlResponse)
        }catch NetworkError.parsingError{return .failure(.parsingError)
        }catch let error                {return .failure(NetworkError.unknown(error))
        }
    }
}
