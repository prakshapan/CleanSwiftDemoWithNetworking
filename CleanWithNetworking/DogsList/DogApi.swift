//
//  DogApi.swift
//  CleanWithNetworking
//
//  Created by EightSquare on 2/1/18.
//  Copyright © 2018 EightSquare. All rights reserved.
//

import Foundation

struct DogApi : Codable {
    
    let message : [String : [String]]?
    let status : String?
    
    private enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
    
}
