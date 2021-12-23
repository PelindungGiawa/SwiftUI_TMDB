//
//  MovieBackDropCard.swift
//  SwiftUI_TMDB
//
//  Created by Pelindung Giawa on 22/12/21.
//

import SwiftUI

struct MovieBackdropCarouseView : View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text (title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) {movie in
                        
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MoviesBackdropCard(movie: movie)
                                .frame(width: 272, height: 200)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
        
    }
}

struct MovieBackDropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouseView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
