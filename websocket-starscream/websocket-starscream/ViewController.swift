//
//  ViewController.swift
//  websocket-starscream
//
//  Created by Alexander Baran on 28/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import Starscream

class ViewController: UIViewController, WebSocketDelegate {

    private let baseUrl = "ws://192.168.0.242"
    private let customNotificationName = Notification.Name("CustomNotification")
    
    var socket: WebSocket!
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSend() {
        print("sending")
        socket.write(string: "yo sending")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sendButton)
        sendButton.anchorCenterSuperview()
        
        let urlString = baseUrl + "/api/websocket"
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
//        socket = WebSocket(url: url!)
//        urlRequest.httpMethod = "POST" // Can't use POST method in gorilla websocket, must be GET.
        // https://stackoverflow.com/questions/32722952/is-it-safe-to-put-a-jwt-into-the-url-as-a-query-parameter-of-a-get-request
        /* Actually when doing GET requests the query string is also protected. SSL/TLS operates at the Transport Layer, so all the crypto goo happens under the application-layer HTTP stuff. The entire transmission, including the query string, the whole URL, and even the type of request (GET, POST, etc.) is encrypted when using HTTPS. */
        urlRequest.addValue("mockJwtToken", forHTTPHeaderField: "Authorization")
        socket = WebSocket(request: urlRequest)
        socket.delegate = self
        socket.connect()
        
//        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { (timer: Timer) in
//            self.socket.write(string: "foo bar")
////            self.socket.write(data: Data())
//        }
        
        // https://developer.apple.com/documentation/foundation/notificationcenter/1415360-addobserver
        // This function does not return anything. The other one with queue parameter does return.
        // Object here is the object you wish to receive notification from, if nil then will receive from all objects that send this notification name.
        NotificationCenter.default.addObserver(self, selector: #selector(handleCustomNotification), name: customNotificationName, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Cleanup when the view disappears. This will remove all observers for this class.
//        NotificationCenter.default.removeObserver(self)
        // This will only remove the specified observer from this class.
        NotificationCenter.default.removeObserver(self, name: customNotificationName, object: nil)
    }
    
    @objc func handleCustomNotification(notification: Notification) {
        guard let values = notification.userInfo as? [String: Any],
              let text = values["text"] as? String,
              let date = values["date"] as? Date else { return }
        
        print("Handling websocket receive from a custom function.")
        print("text:", text)
        print("date:", date.description)
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected", error?.localizedDescription ?? "")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("got some text: \(text)")
        let values: [String: Any] = ["text": text, "date": Date()]
        // https://developer.apple.com/documentation/foundation/notificationcenter/1410608-post
        // object, is the object posting the notification, it can be nil.
        NotificationCenter.default.post(name: customNotificationName, object: nil, userInfo: values)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }

}

