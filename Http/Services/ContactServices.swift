//
//  ContactServices.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation

class ContactServices : APIClient {

    static let shared = ContactServices()

    internal let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    /// Fetch all contacts
    func getAllContacts(completion: @escaping (Result<[Contact]?, APIError>) -> ()) {

        guard let request = ContactFetcher.allContacts.request else {
            return
        }

        fetch(with: request , decode: { json -> [Contact]? in
            guard let results = json as? [Contact] else { return  nil }
            return results
        },completion: completion)
    }

    /// Fetch contact details
    func getContactDetails(id: Int?, completion: @escaping (Result<Contact?, APIError>) -> ()) {
        
         let request = ContactFetcher.contactDetails.requestWith(id: id!)
        fetch(with: request , decode: { json -> Contact? in
            guard let results = json as? Contact else { return  nil }
            return results
        },completion: completion)
    }
    
    /// Fetch post new contact

    func createContact(contact: Contact?, completion: @escaping (Result<Contact?, APIError>) -> ()) {

        guard let request = ContactFetcher.create.postRequest(parameters:contact,
                                                         headers: [HTTPHeader.contentType("application/json")]) else { return }

        fetch(with: request , decode: { json -> Contact? in
            guard let results = json as? Contact else { return  nil }
            return results
        },completion: completion)
    }

    
}
