//
//  APICaller.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 27/02/2023.
//

import Foundation


enum APIError: Error {
case faileFetchingData
}


class APICaller{
    static let shared = APICaller()
    
    
    // get nowplaying movie func
    func getNowplayingMovies(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Urls.nowplaying_movies)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){
            data,_,erorr in
            guard let data = data, erorr == nil
            else{
                return
            }
            do{
                let results = try JSONDecoder().decode(NowplayingRepo.self, from: data)
                print(results)
                completion(.success(results.results))
            }catch{
                print(erorr?.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Urls.toprated_movies)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){
            data,_,erorr in
            guard let data = data, erorr == nil
            else{
                return
            }
            do{
                let results = try JSONDecoder().decode(NowplayingRepo.self, from: data)
                print(results)
                completion(.success(results.results))
            }catch{
                print(erorr?.localizedDescription)
            }
        }
        task.resume()
    }
}
