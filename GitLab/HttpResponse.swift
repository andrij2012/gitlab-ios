//
//  HttpResponse.swift
//  GitLab
//
//  Created by Andrii Valkiv on 1/5/17.
//  Copyright © 2017 Andriy Valkiv. All rights reserved.
//

import Foundation


class HttpResponse {
    var request: HttpRequest!
    var httpCode: Int!
    var status: String!
    var body: String!
    
    init(_ request: HttpRequest! = nil, httpCode: Int! = nil, status: String! = nil, body: String! = nil) {
        self.request  = request
        self.httpCode = httpCode
        self.status   = status
        self.body     = body
    }
}
