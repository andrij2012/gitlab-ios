//
//  Http.swift
//  GitLab
//
//  Created by Andrii Valkiv on 1/5/17.
//  Copyright © 2017 Andriy Valkiv. All rights reserved.
//

import Foundation

class HttpRequest {
    var url: String
    var params: [String: String]
    var queryString: String = ""
    var method: String
    
    init(_ url: String = "", params: [String: String] = [:]) {
        self.url    = url
        self.params = params
        self.method = "GET"
    }
    
    func execute() -> HttpResponse? {
        // TODO: Think if HttpResponse object implementation does need... Looks like it's useless.
        let result = doRequest()
        let response      = HttpResponse()
        response.request  = self
        response.status   = ""
        response.httpCode = 200
        response.body     = result["data"] as! String!
        
        return response
    }
    
    // Do internal request by Swift API
    fileprivate func doRequest() -> [String: Any] {
        var response: [String: Any?] = ["data": nil, "response": nil, "error": nil]
        
        // Format query string if the params property is defined
        if (!params.isEmpty) {
            queryString = "?"
            
            for (name, value) in params {
                queryString += "\(name)=\(value)&"
            }
        }
        
        var request        = URLRequest(url: URL(string: url + queryString) as URL!)
        request.httpMethod = method
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            
            if error != nil {
                // MARK: Debug errors after task was executed
                print("Error=\(error)")
                response["error"] = error
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            // MARK: Debug response string
            print("Response String = \(responseString)")
            
            // MARK: Convert JSON to Dictionary
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any> {
                    // MARK: Debug JSON Dictonary response
                    print(jsonResponse)
                    response["data"] = jsonResponse
                }
            } catch let error {
                // MARK: Debug errors which were followed by unserialization of string into Dictionary
                print(error.localizedDescription)
                response["error"] = error
            }
        }
        
        task.resume()
        
        return response
    }
}
