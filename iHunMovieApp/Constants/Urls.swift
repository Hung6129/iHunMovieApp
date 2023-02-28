//
//  Urls.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 27/02/2023.
//

import Foundation


struct Urls{
    static let tmdb_key = "api_key=f6b0b868e75dbed8c0907797342365dc"
    static let base_url = "https://api.themoviedb.org/3"
    static let image_url = "https://image.tmdb.org/t/p/w500/"
    
    // get now playing movies
    static let nowplaying_movies = "\(base_url)/movie/now_playing?\(tmdb_key)"
    
    
    // get top rated movies
    static let toprated_movies = "\(base_url)/movie/top_rated?\(tmdb_key)"
    
    
}
