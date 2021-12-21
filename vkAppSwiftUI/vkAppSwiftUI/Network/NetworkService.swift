//
//  NetworkService.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation
import Combine
import Alamofire
import SwiftyJSON

class NetworkService {
    
    let baseUrl = "https://api.vk.com/"
    let path = "method/"
    var id: String = ""
    var method: String = ""
    private let apiVersion = "5.130"
    
    private func makeComponents(for path: NetworkPaths) -> URLComponents {
        let urlComponent: URLComponents = {
            var url = URLComponents()
            url.scheme = "https"
            url.host = "api.vk.com"
            url.path = "/method/\(path.rawValue)"
            url.queryItems = [
                URLQueryItem(name: "access_token", value: UserDefaults.standard.string(forKey: "vkToken")),
                URLQueryItem(name: "v", value: apiVersion),
            ]
            return url
        }()
        
        return urlComponent
    }
    
    func getUserPhotos(
        userID: Int,
        completion: @escaping ([VKPhoto]?) -> Void) {
        var urlComponets = makeComponents(for: .getAllPhotos)
        urlComponets.queryItems?.append(contentsOf: [
            URLQueryItem(name: "owner_id", value: "\(userID)"),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "photo_sizes", value: "1"),
        ])

        if let url = urlComponets.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let photoJSONs = json["response"]["items"].arrayValue
                        let vkUserPhoto = photoJSONs.map { VKPhoto($0) }
                        completion(vkUserPhoto)
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }
    
    
    func getUserFriends(completion: @escaping ([VKFriends]?) -> Void) {
        var urlComponents = makeComponents(for: .getFriends)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "fields", value: "photo_200"),
        ])
        
        if let url = urlComponents.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let usersJSONs = json["response"]["items"].arrayValue
                        let vkUsers = usersJSONs.map { VKFriends($0) }
                        DispatchQueue.main.async {
                            completion(vkUsers)
                        }
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }
    
   
    func getUserGroups(completion: @escaping ([VKGroup]?) -> Void) {
        var urlComponents = makeComponents(for: .getGroups)
        urlComponents.queryItems?.append(contentsOf: [
            URLQueryItem(name: "extended", value: "1"),
        ])
        
        if let url = urlComponents.url {
            AF
                .request(url)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        let usersJSONs = json["response"]["items"].arrayValue
                        let vkUsers = usersJSONs.map { VKGroup($0) }
                        completion(vkUsers)
                    case .failure(let error):
                        print(error)
                        completion(nil)
                    }
                }
        }
    }
}
