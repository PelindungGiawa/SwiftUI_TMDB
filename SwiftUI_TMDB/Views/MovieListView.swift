//
//  MovieListView.swift
//  SwiftUI_TMDB
//
//  Created by Pelindung Giawa on 22/12/21.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            
            List {
                if nowPlayingState.movies != nil {
                    MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                } else {
                    LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                    }
                }
                
                if upcomingState.movies != nil {
                    MovieBackdropCarouseView(title: "Upcoming", movies: upcomingState.movies!)
                } else {
                    LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                        self.upcomingState.loadMovies(with: .upcoming)
                    }
                }
                
                if topRatedState.movies != nil {
                    MovieBackdropCarouseView(title: "Top Rated", movies: topRatedState.movies!)
                } else {
                    LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                        self.topRatedState.loadMovies(with: .topRated)
                    }
                }
                
                if popularState.movies != nil {
                    MovieBackdropCarouseView(title: "Popular", movies: popularState.movies!)
                } else {
                    LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                        self.popularState.loadMovies(with: .popular)
                    }
                }
            }
            .navigationBarTitle("List Movie")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
