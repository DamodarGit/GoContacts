import UIKit

protocol ContactListViewProtocol: class {
    var presenter: ContactListPresenterProtocol? { get }
    func showLoader()
    func didRecieved(contacts: [Contact])
    func didFailedWith(eror: String)
}

protocol ContactListInteractorProtocol {
    var output: ContactListInteractorOutputProtocol? { get }
    func getAllContacts()
}

protocol ContactListPresenterProtocol {
    var view: ContactListViewProtocol? { get }
    var interactor: ContactListInteractorProtocol { get }
    var router: ContactListRouterProtocol { get }
    
    func onViewDidLoad()
    func showDetail(_ navigationController: UINavigationController, with contact: Contact)
    func showAddContact(on : UINavigationController)
}

protocol ContactListInteractorOutputProtocol: class {
    func showLoader()
    func didRecievedContacts(_ contacts: [Contact])
    func didFailed(_ error: String)
}

protocol ContactListRouterProtocol {
    var view: ContactListViewProtocol? { get }
    func showDetailView(on navigationController: UINavigationController, with contact: Contact)
    func showAddContact(on navigationController: UINavigationController) 
}

