//
//  Movie+Stub.swift
//  SwiftUI_TMDB
//
//  Created by Pelindung Giawa on 22/12/21.
//

import Foundation

extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodableJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }

    
}


extension Bundle {
    
    func loadAndDecodableJSON<D: Decodable>(filename : String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodeModel = try jsonDecoder.decode(D.self, from: data)
        
        return decodeModel
    }
    
}
