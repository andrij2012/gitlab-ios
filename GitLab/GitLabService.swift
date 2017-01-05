//
//  GitLabService.swift
//  GitLab
//
//  Created by Andrii Valkiv on 1/5/17.
//  Copyright © 2017 Andriy Valkiv. All rights reserved.
//

import Foundation

class GitLabService {
    var credentials: [String: String]
    
    init(credentials: [String: String]) {
        self.credentials = credentials
        
        let request: HttpRequest = HttpRequest()
    }
    
    func connect() {
        
    }
    
    func ping() {
        
    }
}
