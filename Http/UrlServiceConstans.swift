//
//  UrlServiceConstans.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation

/// CONTACTS ENDPOINT
enum ContactFetcher {
    case image
    case allContacts
    case contactDetails
    case update
    case delete
    case create
}

extension ContactFetcher: URLEndPoint {
   
    var base: String {
        return "http://gojek-contacts-app.herokuapp.com"
    }
    
    var path: String {
        switch self {
        case .create: return "/contacts.json"
        case .allContacts: return "/contacts.json"
        case .contactDetails: return "/contacts/{}.json"
        case .update: return "/contacts/{}.json"
        case .delete: return "/3/police"
        case .image: return "/"
        }
    }
    
    
}
