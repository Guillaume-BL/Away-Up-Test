//
//  ApiRequest.swift
//  AwayUp Test
//
//  Created by Guillaume Bovier-Lapierre on 06/09/2020.
//  Copyright © 2020 Guillaume Bovier-Lapierre. All rights reserved.
//

import Foundation


class Requests {
    
    var token = ""
    
    func userAuth (mail: String, pass: String) -> Bool {
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "{\n  \"email\" :\"" + mail + "\",\n  \"password\": \"" + pass + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://api.jwt.awayup.io/auth")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            if (!data.isEmpty) {
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                self.token = json!["accessToken"] as! String
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        if self.token != "" {
            return true
        }
        return false
    }
    
    func userInfos() {
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.jwt.awayup.io/user/myself")!,timeoutInterval: Double.infinity)
        request.addValue("bearer " + token, forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
