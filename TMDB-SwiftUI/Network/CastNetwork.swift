//
//  CastNetwork.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 31/10/22.
//

import Foundation

final class CastNetwork {
    
    func getCast(_ media: MediaType, id: Int, completion: @escaping (Result<Casts, Error>) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/\(media.rawValue)/\(id)/credits?api_key=") else {
            return
        }
        
        Network().callApi(url: url, object: Casts.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
