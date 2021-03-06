//
//  DogsListWorker.swift
//  CleanWithNetworking
//
//  Created by EightSquare on 1/31/18.
//  Copyright (c) 2018 EightSquare. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class DogsListWorker {

    func fetchDataFromWeb(completionHandler: @escaping (_ model: AnyObject) -> Void) {
        WebService.get(url: webUrl.breedList.rawValue, successBlock: { (response) in
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(DogApi.self, from: (response as? Data)!)
                completionHandler(data as AnyObject)
            } catch let err {
                print("Err", err)
            }
        }) { (failed) in
            print(failed)
        }
    }
}
