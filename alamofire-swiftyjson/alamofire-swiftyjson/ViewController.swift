//
//  ViewController.swift
//  alamofire-swiftyjson
//
//  Created by Alexander Baran on 03/10/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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

class ViewController: UIViewController {

    private let baseUrl = "http://192.168.0.242"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTest()
    }

    private func getTest() {
        
        let urlString = baseUrl + "/api/get-test"
        
        var users = [User]()
        
        // https://github.com/Alamofire/Alamofire
        // Response handlers by default are executed on the main dispatch queue. However, a custom dispatch queue can be provided instead.
//        Alamofire.request(urlString).responseJSON { (response) in
////            print("Request: \(String(describing: response.request))")   // original url request
////            print("Response: \(String(describing: response.response))") // http url response
////            print("Result: \(response.result)")                         // response serialization result
//
////            if let json = response.result.value {
////                print("JSON: \(json)") // serialized json response
////            }
//
////            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
////                print("Data: \(utf8Text)") // original server data as UTF8 string
////            }
//
////            switch response.result {
////            case .success:
//////                print("Validation Successful")
////                guard let json = response.result.value as? [String: Any] else { return }
////                print(json)
////            case .failure(let error):
////                print(error)
////            }
////
////            if response.result.isSuccess {
////
////            }
//
//            guard let json = response.result.value as? [String: Any] else { return }
//
//            guard let deep = json["deep"] as? [String: Any] else { return }
//            guard let usersDictionary = deep["users"] as? [[String: Any]] else { return }
//
//            for userDictionary in usersDictionary {
//                let user = User(json: userDictionary)
//                users.append(user)
//            }
//
////            print(users)
//
//        }
        
        Alamofire.request(urlString).responseData { (response) in
            guard let data = response.result.value else { return }
            let json = JSON(data: data)
            guard let username = json["deep"]["users"][2]["username"].string else { return }
            print(username)
        }
        
        
    }
    
//    private func getTest() {
//        let urlString = baseUrl + "/api/get-test"
//        let url = URL(string: urlString)
//        // https://developer.apple.com/documentation/foundation/urlrequest/2011457-init
//        let urlRequest = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if error != nil {
//                print("Failed to do request:", error!)
//                return
//            }
//            //            let dataString = String(data: data!, encoding: String.Encoding.utf8)
//            //            print(dataString!)
//            do {
//                guard let data = data else { return }
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
//                print(json)
//                //                guard let userDictionary = json["user"] as? [String: Any] else { return }
//                //                let user = User(json: userDictionary)
//                //                //                print(user.username, user.id, user.createdTime)
//                //                self.sendPost(user: user)
//            } catch let error {
//                print("Failed to decode json:", error)
//            }
//        }
//        task.resume()
//    }
    
    private func postTest(user: User) {
        let urlString = baseUrl + "/api/post-test"
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
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

