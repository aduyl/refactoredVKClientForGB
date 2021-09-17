//
//  NetworkLayer.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - NetworkLayerProtocol

//https://api.vk.com/method/friends.get?access_token=&fields=bdate,photo_100&v=5.131
// MARK: - NetworkLayer
final class NetworkLayer{
    private let scheme = "https://"
    private let host = "api.vk.com"
    func downloadUsers(token: String = Session.instance.token, complition: @escaping(Result<[User], Error>) -> Void) {
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token": token,
            "fields": "bdate,photo_100",
            "v": "5.131"
        ]
            AF.request(scheme + host + path, method: .get, parameters: parameters).response{ response in
                switch response.result {
                case .failure(let error):
                    complition(.failure(error))
                case .success(let data):
                    guard let data = data, let json = try? JSON(data: data) else { return }
                    
                    let forecastJSON = json["response"]["items"].arrayValue
                    let forecast = forecastJSON.map{ User(json: $0)}
                    complition(.success(forecast))
                }
            }
    }
    
    func downloadGroups(token: String = Session.instance.token, complition: @escaping(Result<[Group], Error>) -> Void) {
        let path = "/method/groups.get"
        let parameters: Parameters = [
            "access_token": token,
            "extended": "1",
            "fields": "photo_100,description,name,id",
            "v": "5.131"
        ]
            AF.request(scheme + host + path, method: .get, parameters: parameters).response{ response in
                switch response.result {
                case .failure(let error):
                    complition(.failure(error))
                case .success(let data):
                    guard let data = data, let json = try? JSON(data: data) else { return }

                    let forecastJSON = json["response"]["items"].arrayValue
                    let forecast = forecastJSON.map{ Group(json: $0)}
                    complition(.success(forecast))
                }
            }
    }
    
    func downloadPhotos(ownerId: Int, token: String = Session.instance.token, complition: @escaping(Result<[PostPhoto], Error>) -> Void) {
        let path = "/method/photos.getAll"
        let parameters: Parameters = [
            "access_token": token,
            "owner_id": "\(String(ownerId))",
            "extended": "1",
            "v": "5.131"
        ]
            AF.request(scheme + host + path, method: .get, parameters: parameters).response{ response in
                switch response.result {
                case .failure(let error):
                    complition(.failure(error))
                case .success(let data):
                    guard let data = data, let json = try? JSON(data: data) else { return }

                    let forecastJSON = json["response"]["items"].arrayValue
                    let forecast = forecastJSON.map{ PostPhoto(json: $0)}
                    complition(.success(forecast))
                }
            }
    }
    
}
