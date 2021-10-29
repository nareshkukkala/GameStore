//
//  userViewModel.swift
//  game store
//
//  Created by naresh kukkala on 26/09/21.
//

import Foundation

class apiCall {
    func getUsers(completion:@escaping ([Result]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=60af9fe8e3245c53ad9c4c0af82d56d6&language=en-US&page=1") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode(Movies.self, from: data!)
            print(users)
            
            DispatchQueue.main.async {
                completion(users.results)
            }
        }
        .resume()
    }
}
