import UIKit

final class ContactListPresenter: ContactListPresenterProtocol {
    var interactor: ContactListInteractorProtocol
    var router: ContactListRouterProtocol
    weak var view: ContactListViewProtocol?
    
    init(router: ContactListRouterProtocol, interactor: ContactListInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
        self.interactor.getAllContacts()
        self.showLoader()
    }
    
    func showDetail(_ navigationController: UINavigationController, with contact: Contact) {
        self.router.showDetailView(on: navigationController, with: contact)
    }
    
    func showAddContact(on controller: UINavigationController) {
        self.router.showAddContact(on: controller)
    }
}

extension ContactListPresenter: ContactListInteractorOutputProtocol {
    func didRecievedContacts(_ contacts: [Contact]) {
        self.view?.didRecieved(contacts: contacts)
    }
    
    func didFailed(_ error: String) {
        self.view?.didFailedWith(eror: error)
    }
    
    func showLoader() {
        self.view?.showLoader()
    }
}

