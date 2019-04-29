//
//  ContactListViewSpec.swift
//  GoContactsTests
//
//  Created by Damodar, Namala (623-Extern) on 29/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import XCTest
@testable import GoContacts

class ContactListViewSpec: XCTestCase {
    var presenter: ContactListPresenter!
    var interactor: ContactListInteractor!
    var router: ContactListRouter!

    var view: ContactListView!

    override func setUp() {
        interactor = ContactListInteractor()
        router = ContactListRouter()
        view = ContactListView()
        presenter = ContactListPresenter(router: router, interactor: interactor)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testThatItShowsCarDetailScreen() {
        let controller = UINavigationController()
        let contact = Contact(first_name: "Damu", last_name: "namala", email: "damu@gmail.com", mobile: "8989789887", phone_number: "8767876667", favorite: true, id: nil, profile_pic: nil)
        presenter.showDetail(controller, with: contact)
        XCTAssertNil(view.contacts, "messages not nil")

    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
