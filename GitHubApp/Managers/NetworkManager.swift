//
//  NetworkManager.swift
//  GitHubApp
//
//  Created by Rafael Levy on 7/14/21.
//

import UIKit


class NetworkManager {
    
    // Singleton 
    static let shared = NetworkManager()
    private let baseUrl: String = "https://api.github.com/users/"
    // Cache
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}

    
   
    func getFollowers(username: String, page: Int, completion: @escaping (Result<[Followers], GHError>) -> Void) {
        let endPoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.invalidReq))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidRes))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Followers].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
    

    
    func getUserInfo(for username: String, completion: @escaping (Result<User,GHError>)  -> Void)  {
        let endPoint = baseUrl + "\(username)"
    
        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidReq))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidRes))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
        
    
    }
    
    func downloadImage(from urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completionHandler(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
           
            guard let self = self, error == nil , let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data, let image = UIImage(data: data) else {
                completionHandler(nil)
                return
            }
              
            self.cache.setObject(image, forKey: cacheKey)
            completionHandler(image)
            
        }.resume()
    }
    
    
}
