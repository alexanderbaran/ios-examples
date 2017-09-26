//
//  ViewController.swift
//  swift4-json
//
//  Created by Alexander Baran on 26/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

//struct Course {
//
//    let id: Int
//    let name: String
//    let link: String
//    let imageUrl: String
//
//    init(json: [String: Any]) {
//        self.id = json["id"] as? Int ?? 0
//        self.name = json["name"] as? String ?? ""
//        self.link = json["link"] as? String ?? ""
//        self.imageUrl = json["imageUrl"] as? String ?? ""
//    }
//
//}

//struct Course: Decodable {
//    let id: Int
//    let name: String
//    let link: String
//    let imageUrl: String
//}

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

// If you make your properties optional then it should be able to parse missing properties correctly without error.
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
//        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print(error!)
                return
            }
//            guard let response = response as? HTTPURLResponse else { return }
//            print(response)
//            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            do {
//                // Swift 2 and 3 method.
//                guard let data = data else { return }
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
//                let course = Course(json: json)
//                print(course)
                // Swift 4.
                guard let data = data else { return }
//                let course = try JSONDecoder().decode(Course.self, from: data)
//                print(course)
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription)
            } catch let error {
                print("Error serializing json:", error)
            }
        }
        task.resume()
    }

}

