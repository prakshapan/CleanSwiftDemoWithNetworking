//
//  WebService.swift
//  CleanWithNetworking
//
//  Created by EightSquare on 2/2/18.
//  Copyright © 2018 EightSquare. All rights reserved.
//

import Foundation
import UIKit
import Networking

let networking = Networking(baseURL: "https://dog.ceo/api/")

enum webUrl:String {
    case breedList = "breeds/list/all"
}

class WebService: NSObject {

    class func get(
        url:String,
        parameters:[String:AnyObject] = [:],
        successBlock:@escaping ((_ response:AnyObject?) -> Void),
        failureBlock:@escaping ((_ message:String) -> Void)){

        networking.get(url, parameters: parameters){ result in
            switch result {
            case .success(let response):
               successBlock(response.data as AnyObject)
                break
            case .failure( _):
                failureBlock("Something went wrong")
                break
            }
        }
    
    }
}
