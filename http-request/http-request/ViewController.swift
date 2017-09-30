//
//  ViewController.swift
//  http-request
//
//  Created by Alexander Baran on 28/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class User: Encodable {

    let id: Int
    let username: String
    let createdTime: Int

    init(json: [String: Any]) {
        self.id = json["id"] as? Int ?? 0
        self.username = json["username"] as? String ?? ""
        self.createdTime = json["createdTime"] as? Int ?? 0
    }

}

//class User: Decodable {
//
//    let id: Int?
//    let username: String?
//    let createdTime: Int?
//
//}

class ViewController: UIViewController {
    
    private let baseUrl = "http://192.168.0.242"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = baseUrl + "/api/get-test"
        let url = URL(string: urlString)
        // https://developer.apple.com/documentation/foundation/urlrequest/2011457-init
        let urlRequest = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print("Failed to do request:", error!)
                return
            }
//            let dataString = String(data: data!, encoding: String.Encoding.utf8)
//            print(dataString!)
            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
                guard let userDictionary = json["user"] as? [String: Any] else { return }
                let user = User(json: userDictionary)
//                print(user.username, user.id, user.createdTime)
                self.sendPost(user: user)
            } catch let error {
                print("Failed to decode json:", error)
            }
        }
        task.resume()
    }
    
    private func sendPost(user: User) {
        let urlString = baseUrl + "/api/post-test"
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // https://developer.apple.com/documentation/foundation/urlrequest/2011415-httpmethod
        urlRequest.httpMethod = "POST"
        do {
            let body = try JSONEncoder().encode(user)
            urlRequest.httpBody = body
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                if error != nil {
                    print("Failed to do post request:", error!)
                    return
                }
            })
            task.resume()
        } catch let error {
            print("Failed to encode json:", error)
        }
    }

}

















