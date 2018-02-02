//
//  DogsListModels.swift
//  CleanWithNetworking
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum DogsList
{
    // MARK: Use cases
    
    enum FetchData
    {
        struct Request
        {
            
        }
        struct Response
        {
            let dogApi: DogApi
        }
        struct ViewModel
        {
            let breedName: [String]
            let breedTypes: [String]
        }
    }
}